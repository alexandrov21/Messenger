import 'package:messenger_app/models/sign_up_model.dart';

class SignUpPageState {}

class UserFullInfoState extends SignUpPageState {
  final SignUpModel fullInfo;

  UserFullInfoState(
    this.fullInfo,
  );
}

class SignUpPageErrorState extends SignUpPageState {
  final String errorMessage;

  SignUpPageErrorState(
    this.errorMessage,
  );
}

class SignUpPageEmptyState extends SignUpPageState {}