import 'package:dev_quiz/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.title,
    required this.answers,
  }) : assert(answers.length == 4);

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(
          map['answers'].map((answer) => AnswerModel.fromMap(answer))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answer': answers.map((answer) => answer.toMap()).toList()
    };
  }
}
