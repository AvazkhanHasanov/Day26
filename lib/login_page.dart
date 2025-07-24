import 'package:day_26_darsda/widgets/login_form.dart';
import 'package:day_26_darsda/register_page.dart';
import 'package:day_26_darsda/utils/Colors.dart';
import 'package:day_26_darsda/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailRegex = RegExp(
    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome back,', style: AppStyles.text1),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please login to enjoy full feature',
                  style: AppStyles.text2,
                ),
                SizedBox(
                  height: 44,
                ),
                loginForm(
                  formKey: formKey,
                  emailController: emailController,
                  emailRegex: emailRegex,
                  passwordController: passwordController,
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
                            content: Text('Login'),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.blue,
                    ),
                    child: Text(
                      'Login',
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
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: RichText(
                    text: TextSpan(
                      text: 'Not have an account ?',
                      style: AppStyles.hintC,
                      children: [
                        TextSpan(
                          text: ' Register now',
                          style: AppStyles.text3,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
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
