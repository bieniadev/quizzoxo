import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzoxo/services/models.dart';
import 'package:quizzoxo/widgets/progress_bar.dart';

class TopicProgress extends StatelessWidget {
  const TopicProgress({super.key, required this.topic});

  final Topic topic;

  Widget _progressCount(Report report, Topic topic) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        '${report.topics[topic.id]?.length ?? 0} / ${topic.quizzes.length}',
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      ),
    );
  }

  double _calculateProgress(Report report, Topic topic) {
    try {
      int totalQuizzes = topic.quizzes.length;
      int completedQuizzes = report.topics[topic.id].length;
      return completedQuizzes / totalQuizzes;
    } catch (error) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);

    return Row(
      children: [
        _progressCount(report, topic),
        Expanded(
          child: AnimatedProgressBar(
            value: _calculateProgress(report, topic),
            height: 8,
          ),
        )
      ],
    );
  }
}
