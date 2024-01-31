import 'package:flutter/material.dart';

abstract class TextStyles {
  static const loginText = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 40,
  );
  static const pleaseContinueText = TextStyle(
    fontSize: 20,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );
  static const textFieldLabelText = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );
  static const logInButtonText = TextStyle(
    fontWeight: FontWeight.w600,
  );
  static const helpQuestionText = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  );
  static const helpSignUpButtonText = TextStyle(
    fontWeight: FontWeight.w600,
  );
  static const createAccountText = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 32,
  );
  static const signUpButtonText = TextStyle(
    fontWeight: FontWeight.w600,
  );
  static const helpSignInButtonText = TextStyle(
    fontWeight: FontWeight.w600,
  );
}