import '../models/sign_up_model.dart';

abstract class SignUpMock {
  static List<SignUpModel> signUp = [
    SignUpModel(
      'Alex Alexandrov',
      'alex@gmail.com',
      '12345',
    ),
  ];
}
