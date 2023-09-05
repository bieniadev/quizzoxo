import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quizzoxo/providers/quiz_state.dart';
import 'package:quizzoxo/services/firestore.dart';
import 'package:quizzoxo/widgets/loading.dart';
import 'package:quizzoxo/widgets/progress_bar.dart';
import 'package:quizzoxo/widgets/quiz_congrats.dart';
import 'package:quizzoxo/widgets/quiz_question.dart';
import 'package:quizzoxo/widgets/quiz_start.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.quizId});
  final String quizId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizState(),
      child: FutureBuilder(
        future: FirestoreService().getQuiz(quizId),
        builder: (context, snapshot) {
          var state = Provider.of<QuizState>(context);

          if (!snapshot.hasData || snapshot.hasError) {
            return const Loader();
          } else {
            var quiz = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: AnimatedProgressBar(value: state.progress),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(FontAwesomeIcons.xmark),
                ),
              ),
              body: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: state.controller,
                onPageChanged: (int index) => state.progress = (index / (quiz.questions.length + 1)),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return StartPage(quiz: quiz);
                  } else if (index == quiz.questions.length + 1) {
                    return CongratsPage(quiz: quiz);
                  } else {
                    return QuestionPage(question: quiz.questions[index - 1]);
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
