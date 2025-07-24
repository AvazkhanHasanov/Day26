import 'package:day_26_darsda/login_page.dart';
import 'package:day_26_darsda/widgets/register_form.dart';
import 'package:day_26_darsda/utils/Colors.dart';
import 'package:day_26_darsda/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  final confirmController = TextEditingController();
  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  void dispose() {
    userController.dispose();
    confirmController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 24),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Welcome to ',
                    style: AppStyles.text1,
                    children: [
                      TextSpan(text: ' Now', style: AppStyles.now),
                      TextSpan(text: 'TV', style: AppStyles.tv),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  'Create an account to explore amazing feature',
                  style: AppStyles.text2,
                ),
                SizedBox(
                  height: 44,
                ),
                registerForm(
                  formKey: formKey,
                  userController: userController,
                  emailRegex: emailRegex,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmController: confirmController,
                ),

                SizedBox(
                  height: 46,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Register'),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.blue,
                    ),
                    child: Text(
                      'Register',
                      style: AppStyles.login,
                    ),
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Text(
                  'Or login with',
                  style: AppStyles.orLogin,
                ),
                SizedBox(
                  height: 34,
                ),
                Row(
                  spacing: 40,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.color35,
                        ),
                        icon: SvgPicture.asset('assets/google.svg'),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.color35,
                        ),
                        icon: SvgPicture.asset('assets/facebook.svg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: RichText(
                    text: TextSpan(
                      text: 'Have an account ?',
                      style: AppStyles.hintC,
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: AppStyles.text3,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
