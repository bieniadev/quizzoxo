import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzoxo/providers/quiz_state.dart';
import 'package:quizzoxo/services/models.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            quiz.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(child: Text(quiz.description)),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: state.nextPage,
                icon: const Text('Start Quiz!'),
                label: const Icon(Icons.poll),
              )
            ],
          )
        ],
      ),
    );
  }
}
