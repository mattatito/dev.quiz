import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/result/result_page.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if(controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    length: widget.questions.length,
                  ),
                )
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map(
              (question) => QuizWidget(
                question: question,
                onChange: nextPage,
              ),
            )
            .toList(),
        controller: pageController,
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      children: [
                        if (value < widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.white(
                              label: "Pular",
                              onTap: nextPage,
                            ),
                          ),
                        if (value == widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.green(
                              label: "Confirmar",
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage()));
                              },
                            ),
                          )
                      ],
                    ))
            //Abordagens:
            //Podemos tirar o botão de confirmar, fazendo com que o botão "pular" seja o de "avançar"
            //Ou, podemos deixar MAS teria que alterar o fluxo do AnswerWidget para que ele selecione os itens
            //para que o botão de "confirmar" faça sentido.

            ),
      ),
    );
  }
}
