import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(HomeRepository());

  @override
  void initState() {
    controller.getQuizzes();
    controller.getUser();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    switch(controller.state){
      case HomeState.success:
        return Scaffold(
          appBar: AppBarWidget(
            user: controller.user!,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                    ),
                    LevelButtonWidget(
                      label: "Perito",
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: controller.quizzes!
                          .map((quiz) => QuizCardWidget(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengePage(questions: quiz.questions,)));
                        },
                        title: quiz.title,
                        completed:
                        "${quiz.questionAnswered}/${quiz.questions.length}",
                        percent: quiz.questionAnswered / quiz.questions.length,
                      ))
                          .toList(),
                    ))
              ],
            ),
          ),
        );
      case HomeState.loading:
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
            ),
          ),
        );

      case HomeState.error:
        return Scaffold(
          body: Center(
            child: Text("Um erro aconteceu =( Tente reiniciar o app.", style: AppTextStyles.body,),
          ),
        );
      case HomeState.empty:
        return Container();
    }

  }
}
