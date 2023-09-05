import 'package:flutter/material.dart';
import 'package:quizzoxo/screens/topic_info.dart';
import 'package:quizzoxo/services/models.dart';
import 'package:quizzoxo/widgets/topic_progress.dart';

class TopicItem extends StatelessWidget {
  const TopicItem({super.key, required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.img,
      child: Card(
        clipBehavior: Clip.antiAlias, // Rounded edges
        child: InkWell(
          // Makes card tapable
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TopicInfoScreen(topic: topic),
            ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Image.asset(
                  'assets/covers/${topic.img}',
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  topic.title,
                  style: const TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              )),
              Flexible(
                child: TopicProgress(topic: topic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
