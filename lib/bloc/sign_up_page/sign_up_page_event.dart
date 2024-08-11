class SignUpPageEvent {}

class CheckingFullUserInfoEvent extends SignUpPageEvent {
  final String enteringFullName;
  final String enteringEmail;
  final String enteringPassword;
  final String enteringConfirmPassword;

  CheckingFullUserInfoEvent({
    required this.enteringFullName,
    required this.enteringEmail,
    required this.enteringPassword,
    required this.enteringConfirmPassword,
  });
}

class ResetEvent extends SignUpPageEvent {}
