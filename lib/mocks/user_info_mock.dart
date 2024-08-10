import '../models/user_info_model.dart';

abstract class UserInfoMock {
  static List<UserInfoModel> userInfo = [
    UserInfoModel(
      'alex@gmail.com',
      '12345',
      'alexa',
    ),
  ];
}
