class SignUpPageEvent {}

class CheckingFullUserInfoEvent extends SignUpPageEvent {
  final String enteringFullName;
  final String enteringEmail;
  final String enteringPassword;
  final String enteringConfirmPassword;

  CheckingFullUserInfoEvent(
    this.enteringFullName,
    this.enteringEmail,
    this.enteringPassword,
    this.enteringConfirmPassword,
  );
}

class ResetEvent extends SignUpPageEvent{}