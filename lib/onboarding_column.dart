import 'package:day_26_darsda/utils/styles.dart';
import 'package:flutter/material.dart';

class OnboardingColumn extends StatefulWidget {
  const OnboardingColumn({
    super.key,
    required this.controller,
    required this.text1,
    required this.text2,
    required this.button1,
    required this.rasm, required this.button2,
  });

  final String text1, text2, button1,button2, rasm;
  final PageController controller;

  @override
  State<OnboardingColumn> createState() => _OnboardingColumnState();
}

class _OnboardingColumnState extends State<OnboardingColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              widget.rasm,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF000000).withAlpha(0),
                      Color(0xFF252525),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height:38 ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                widget.text1,
                style: AppStyles.textS,
              ),
              SizedBox(height:18 ),
              Text(
                textAlign: TextAlign.center,
                widget.text2,
                style: AppStyles.textS2,
              ),

            ],
          ),
        ),
      ],
    );
  }
}
