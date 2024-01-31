import '../../models/all_dialogs_model.dart';
import '../../models/user.dart';

class AllDialogsPageState {}

class ContactsState extends AllDialogsPageState {
  final List<AllDialogsModel> users;

  ContactsState(
    this.users,
  );
}
class AllDialogsPageErrorState extends AllDialogsPageState{}
class AllDialogsPageEmptyState extends AllDialogsPageState{}
