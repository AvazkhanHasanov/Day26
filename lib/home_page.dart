import 'package:day_26_darsda/onboarding_column.dart';
import 'package:day_26_darsda/utils/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final myList = [
      OnboardingColumn(
        controller: controller,
        text1: 'Easy Streaming',
        text2: 'Choose your plan to watch live match your favourite club.',
        button1: 'Next',
        rasm: 'assets/png1.png',
        button2: 'Skip',
      ),
      OnboardingColumn(
        controller: controller,
        text1: 'Always Uptodate ',
        text2: 'Stay updated with match highlight, preview and hot news',
        button1: 'Next',
        rasm: 'assets/Mask2.png',
        button2: 'Back',
      ),
      OnboardingColumn(
        controller: controller,
        text1: 'Get Amazing Reward ',
        text2: 'Redeem your points to get an amazing reward',
        button1: 'Let’s Get Started',
        rasm: 'assets/messi3.png',
        button2: 'Back',
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E1E1E),
              Color(0xFF2E2E2E),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(

          children: [
            SizedBox(
              height: (530 * MediaQuery.of(context).size.height) / 844,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  currentIndex = index;
                  setState(() {});
                },
                children: [
                  ...myList,
                ],
              ),
            ),
              SizedBox(height: 80,),
              SizedBox(
                  height: 30,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(width: 8 ,),

                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Color(0xFF454343)
                            : Color(0xFF777777),
                        shape: BoxShape.circle,
                      ),
                    ),
                    itemCount: myList.length,
                  ),
                ),


            Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFFEAEAEA),
                  backgroundColor: Color(0xFF00A3B7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  currentIndex == myList.length - 1
                      ? 'Let`s Get Started'
                      : 'Next',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 16.5),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  currentIndex == 0
                      ? controller.animateToPage(
                          myList.length - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        )
                      : controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  currentIndex == 0 ? 'Skip' : 'Back',
                  style: AppStyles.Button2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
