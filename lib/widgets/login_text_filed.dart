import 'package:day_26_darsda/utils/Colors.dart';
import 'package:day_26_darsda/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  LoginTextField({
    this.isPassword = false,
    super.key,
    required this.controller,
    required this.icon1,
    required this.hint,
    required this.validator,
  });

  final IconData icon1;
  final bool isPassword;

  final String hint;

  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool isObscured;

  @override
  void initState() {
    isObscured = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      style: TextStyle(
        color: AppColors.gray,
      ),
      controller: widget.controller,
      cursorColor: AppColors.gray,
      obscureText: isObscured,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF3F3F3F),
          ),
        ),
        hintStyle: AppStyles.hintStyle,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
                style: IconButton.styleFrom(foregroundColor: AppColors.gray),
                icon: Icon(
                  isObscured ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        prefixIcon: Icon(
          widget.icon1,
          color: AppColors.gray,
        ),
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textField1, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: AppColors.textField2,
        constraints: BoxConstraints.tightFor(width: 300),
      ),
    );
  }
}
