import 'package:day_26_darsda/widgets/login_text_filed.dart';
import 'package:flutter/material.dart';

class registerForm extends StatelessWidget {
  const registerForm({
    super.key,
    required this.formKey,
    required this.userController,
    required this.emailRegex,
    required this.emailController,
    required this.passwordController,
    required this.confirmController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userController;
  final RegExp emailRegex;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 40,
        children: [
          LoginTextField(
            controller: userController,
            icon1: Icons.account_circle_outlined,
            hint: 'Username or Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Og'a Joyni to'ldirish shart ";
              } else if (!emailRegex.hasMatch(value)) {
                return 'Email formati noto‘g‘ri';
              }
              return null;
            },
          ),
          LoginTextField(
            controller: emailController,
            icon1: Icons.email_outlined,
            hint: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Og'a Joyni to'ldirish shart ";
              } else if (!emailRegex.hasMatch(value)) {
                return 'Email formati noto‘g‘ri';
              }
              return null;
            },
          ),
          LoginTextField(
            controller: passwordController,
            icon1: Icons.key,
            hint: 'Password',
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Og'a Joyni to'ldirish shart ";
              } else if (value.length <= 8) {
                return "eng kamida 8 ta belgi bo'lsin";
              }
              return null;
            },
          ),
          LoginTextField(
            isPassword: true,
            controller: confirmController,
            icon1: Icons.key,
            hint: 'Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Og'a Joyni to'ldirish shart ";
              } else if (value.length <= 8) {
                return "eng kamida 8 ta belgi bo'lsin";
              } else if (!(passwordController.text == confirmController.text)) {
                return "parol mos kelmadi";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
