import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:quizzoxo/providers/quiz_state.dart';
import 'package:quizzoxo/services/models.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);

    _bottomSheet(BuildContext context, Option opt, QuizState state) {
      bool correct = opt.correct;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(correct ? 'Good Job!' : 'Wrong'),
                Text(
                  opt.detail,
                  style: const TextStyle(fontSize: 18, color: Colors.white54),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: correct ? Colors.green : Colors.red),
                  child: Text(
                    correct ? 'Onward!' : 'Try Again',
                    style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (correct) {
                      state.nextPage();
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Column(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text(question.text),
        )),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: question.options.map((option) {
              return Container(
                height: 90,
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.black26,
                child: InkWell(
                  onTap: () {
                    state.selected = option;
                    _bottomSheet(context, option, state);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(state.selected == option ? FontAwesomeIcons.circleCheck : FontAwesomeIcons.circle, size: 30),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            child: Text(
                              option.value,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
