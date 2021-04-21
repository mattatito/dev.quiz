import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
      name: "Matheus",
      photoUrl:
          "https://avatars.githubusercontent.com/u/50848469?s=400&u=3bd01201742277005ae0a0db738f6d7f0dc66a64&v=4",
    );
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
          title: "NLW 5 - Flutter",
          questions: [
            QuestionModel(
                title: "Está curtindo o Flutter?",
                answers: [
                  AnswerModel(title: "Estou curtindo"),
                  AnswerModel(title: "Show de bola!", isRight: true,),
                  AnswerModel(title: "Muito Top"),
                  AnswerModel(title: "Amando Flutter"),
                ]
            ),
            QuestionModel(
                title: "Está curtindo o Flutter?",
                answers: [
                  AnswerModel(title: "Estou curtindo"),
                  AnswerModel(title: "Show de bola!", isRight: true,),
                  AnswerModel(title: "Muito Top"),
                  AnswerModel(title: "Amando Flutter"),
                ]
            ),
            QuestionModel(
                title: "Está curtindo o Flutter?",
                answers: [
                  AnswerModel(title: "Estou curtindo"),
                  AnswerModel(title: "Show de bola!", isRight: true,),
                  AnswerModel(title: "Muito Top"),
                  AnswerModel(title: "Amando Flutter"),
                ]
            ),
            QuestionModel(
                title: "Está curtindo o Flutter?",
                answers: [
                  AnswerModel(title: "Estou curtindo"),
                  AnswerModel(title: "Show de bola!", isRight: true,),
                  AnswerModel(title: "Muito Top"),
                  AnswerModel(title: "Amando Flutter"),
                ]
            )
          ],
          image: AppImages.blocks,
          level: Level.facil)
    ];
  }
}
