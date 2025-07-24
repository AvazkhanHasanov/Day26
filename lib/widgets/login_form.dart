import 'package:day_26_darsda/widgets/login_text_filed.dart';
import 'package:day_26_darsda/utils/styles.dart';
import 'package:flutter/material.dart';

class loginForm extends StatelessWidget {
  const loginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.emailRegex,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final RegExp emailRegex;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 40,
        children: [
          LoginTextField(
            controller: emailController,
            icon1: Icons.person_pin,
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
          Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
              Text(
                'Forgot password',
                textAlign: TextAlign.end,
                style: AppStyles.hintC,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
