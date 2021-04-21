import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  HomeController(this.repository);

  final stateNotifier = ValueNotifier(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final HomeRepository repository;

  void getUser() async {
    state = HomeState.loading;

    try{
      user = await repository.getUser();
      state = HomeState.success;
    }catch(exception){
      state = HomeState.error;
      print(exception);
    }
  }

  void getQuizzes() async {
    state = HomeState.loading;
    try{
      quizzes = await repository.getQuizzes();
      state = HomeState.success;
    }catch(exception){
      state = HomeState.error;
    }
  }
}
