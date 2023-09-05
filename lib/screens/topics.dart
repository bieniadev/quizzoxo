import 'package:flutter/material.dart';
import 'package:quizzoxo/screens/drawer.dart';
import 'package:quizzoxo/services/error.dart';
import 'package:quizzoxo/services/firestore.dart';
import 'package:quizzoxo/services/models.dart';
import 'package:quizzoxo/widgets/bottom_nav_bar.dart';
import 'package:quizzoxo/widgets/loading.dart';
import 'package:quizzoxo/widgets/topics_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        } else if (snapshot.hasError) {
          return ErrorMess(
            message: snapshot.error.toString(),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            bottomNavigationBar: const BottomNavBar(),
            drawer: TopicDrawer(topics: topics),
            body: GridView.count(
              crossAxisCount: 2,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
          );
        } else {
          return const Text('No topics found');
        }
      },
    );
  }
}
