import 'package:flutter/material.dart';
import 'package:quizzoxo/services/models.dart';
import 'package:quizzoxo/widgets/quiz_list.dart';

class TopicInfoScreen extends StatelessWidget {
  const TopicInfoScreen({super.key, required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Hero(
              tag: topic.img,
              child: Image.asset(
                'assets/covers/${topic.img}',
                width: MediaQuery.of(context).size.width,
              )),
          Text(
            topic.title,
            style: const TextStyle(
              height: 2,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          QuizList(topic: topic),
        ],
      ),
    );
  }
}
