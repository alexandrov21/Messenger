import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/sign_up_page/sign_up_page_event.dart';
import 'package:messenger_app/bloc/sign_up_page/sign_up_page_state.dart';
import 'package:messenger_app/mocks/sign_up_mock.dart';

import '../../models/sign_up_model.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  SignUpPageBloc() : super(SignInPageEmptyState()) {
    on<CheckingFullUserInfoEvent>((event, emit) {
      final fullInfo = _checkConfirmPassword()
    });
  }

  SignUpModel? _checkConfirmPassword({
    required String enteringFullName,
    required String enteringEmail,
    required String enteringPassword,
    required String enteringConfirmPassword,
  }) {
    if (enteringConfirmPassword == SignUpMock.signUp.first.password) {
      return SignUpModel(enteringFullName, enteringEmail, enteringPassword,);
    }
    return null;
  }
}