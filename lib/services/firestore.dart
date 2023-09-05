import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quizzoxo/services/auth.dart';
import 'package:quizzoxo/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Read all documents from topics
  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get();

    var data = snapshot.docs.map((snp) => snp.data());
    var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }

  // Single quiz read
  Future<Quiz> getQuiz(String quizId) async {
    var ref = _db.collection('quizzes').doc(quizId);
    var snapshot = await ref.get();

    return Quiz.fromJson(snapshot.data() ?? {});
  }

  // Stream if user logs in and logs out
  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1), // if null == start at 1 else increment by 1
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id]),
      }
    };
    return ref.set(data, SetOptions(merge: true)); // SetOptions == will not override existing values
  }
}
