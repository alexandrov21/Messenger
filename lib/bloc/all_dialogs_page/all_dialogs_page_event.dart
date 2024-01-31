class AllDialogsPageEvent {}

class LoadingUserEvent extends AllDialogsPageEvent {
  final String userId;

  LoadingUserEvent({
    required this.userId,
  });
}
