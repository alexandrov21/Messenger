import '../../models/user_info_model.dart';

class SignInPageState {}

class UserInfoState extends SignInPageState {
  final UserInfoModel personalInfo;

  UserInfoState(
    this.personalInfo,
  );
}

class SignInPageErrorState extends SignInPageState {
  final String errorMessage;

  SignInPageErrorState(
    this.errorMessage,
  );
}

class SignInPageEmptyState extends SignInPageState {}
