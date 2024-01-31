import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/all_dialogs_page/all_dialogs_page_bloc.dart';
import 'package:messenger_app/bloc/sign_in_page/sign_in_page_event.dart';
import 'package:messenger_app/bloc/sign_in_page/sign_in_page_state.dart';
import 'package:messenger_app/mocks/user_info_mock.dart';

import '../../models/user_info_model.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  SignInPageBloc() : super(SignInPageEmptyState()) {
    on<CheckingUserInfoEvent>((event, emit) {
      final personalInfo = _checkUserInfo(
        enteringEmail: event.enteringEmail,
        enteringPassword: event.enteringPassword,
      );
      if (personalInfo == null) {
        emit(SignInPageErrorState('wrong password or email'));
      } else {
        emit(UserInfoState(personalInfo));
      }
    });
    on<ResetEvent>((event, emit) {
      emit (SignInPageEmptyState());
    });
  }

  UserInfoModel? _checkUserInfo({
    required String enteringEmail,
    required String enteringPassword,
  }) {
    if (enteringEmail == UserInfoMock.userInfo.first.userEmail &&
        enteringPassword == UserInfoMock.userInfo.first.userPassword) {
      return UserInfoModel(
        enteringEmail,
        enteringPassword,
        UserInfoMock.userInfo.first.name,
      );
    }
    return null;
  }
}
