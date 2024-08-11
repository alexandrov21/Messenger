import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/sign_up_page/sign_up_page_event.dart';
import 'package:messenger_app/bloc/sign_up_page/sign_up_page_state.dart';
import 'package:messenger_app/mocks/sign_up_mock.dart';

import '../../models/sign_up_model.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  SignUpPageBloc() : super(SignUpPageEmptyState()) {
    on<CheckingFullUserInfoEvent>((event, emit) {
      final fullInfo = _checkConfirmPassword(enteringFullName: event.enteringFullName,
        enteringEmail: event.enteringEmail,
        enteringPassword: event.enteringPassword,
        enteringConfirmPassword: event.enteringConfirmPassword,);
      if (fullInfo == null) {
        emit(SignUpPageErrorState('the password isnt confirm'));
      } else if(fullInfo is SignUpModel){
        emit(UserFullInfoState(fullInfo));
      }
    });

    on<ResetEvent>((event, emit) {
      emit (SignUpPageEmptyState());
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