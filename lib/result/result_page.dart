import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int questionsAnswered;

  const ResultPage({Key? key,required this.title,required this.length,required this.questionsAnswered}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu ",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                          text: "\n$title",
                          style: AppTextStyles.bodyBold,
                        ),
                        TextSpan(
                          text: "\nCom $questionsAnswered de $length acertos",
                          style: AppTextStyles.body,
                        )
                      ]),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
           Column(

             children: [
               Row(
                 children: [
                   Expanded(child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 68),
                     child: NextButtonWidget.purple(label: "Compartilhar", onTap: (){
                       Share.share("DevQuiz - Resultado do Quiz $title\n Obtive ${questionsAnswered/length}% de aproveitamento! ");
                     }),
                   )),
                 ],
               ),
               SizedBox(
                 height: 24,
               ),
               Row(
                 children: [
                   Expanded(child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 68),
                     child: NextButtonWidget.white(label: "Voltar ao Início", onTap: (){
                       Navigator.pop(context);
                     }),
                   )),
                 ],
               )
             ],
           )
          ],

        ),
      ),
    );
  }
}
