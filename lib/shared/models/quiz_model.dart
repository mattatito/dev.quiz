import 'dart:convert';

import 'package:dev_quiz/shared/models/question_model.dart';

enum Level {
  facil,
  medio,
  dificil,
  perito,
}

extension LevelStringExt on String {
  Level get levelParse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.questionAnswered = 0,
      required this.image,
      required this.level});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((question) => question.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
        title: map['title'],
        questionAnswered: map['questionAnswered'],
        questions: List<QuestionModel>.from(map['questions'].map(
          (question) => QuestionModel.fromMap(question),
        )),
        image: map['image'],
        level: map['level'].toString().levelParse);
  }

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
