import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,

              child: Stack(
                children: [
                  Container(
                    height: 190,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(
                          text: "Olá, ",style: AppTextStyles.title,
                          children:[
                            TextSpan(
                              text: "Mattatito",
                              style: AppTextStyles.titleBold
                            )
                          ]
                        )
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://avatars.githubusercontent.com/u/50848469?s=400&u=3bd01201742277005ae0a0db738f6d7f0dc66a64&v=4")
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 1.5),
                      child: ScoreCardWidget()
                  )
                ],
              ),
            ),
  );
}
