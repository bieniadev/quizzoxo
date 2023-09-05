import 'package:flutter/material.dart';
import 'package:quizzoxo/services/models.dart';
import 'package:quizzoxo/widgets/quiz_badge.dart';
import 'package:quizzoxo/screens/quiz.dart';

class QuizList extends StatelessWidget {
  const QuizList({super.key, required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: topic.quizzes.map((quiz) {
        return Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          elevation: 4,
          margin: const EdgeInsets.all(4),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QuizScreen(quizId: quiz.id),
              ));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  quiz.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subtitle: Text(
                  quiz.description,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                leading: QuizBadge(topic: topic, quizId: quiz.id),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
