import 'package:flutter/material.dart';
import 'package:quizzoxo/services/models.dart';
import 'package:quizzoxo/widgets/quiz_list.dart';

class TopicDrawer extends StatelessWidget {
  const TopicDrawer({super.key, required this.topics});

  final List<Topic> topics;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: topics.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          Topic topic = topics[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  topic.title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70),
                ),
              ),
              QuizList(
                topic: topic,
              ),
            ],
          );
        },
      ),
    );
  }
}
