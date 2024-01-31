import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/all_dialogs_page/all_dialogs_page_event.dart';
import 'package:messenger_app/bloc/all_dialogs_page/all_dialogs_page_state.dart';
import 'package:messenger_app/mocks/all_dialogs_mock.dart';
import 'package:messenger_app/models/all_dialogs_model.dart';

class AllDialogsPageBloc
    extends Bloc<AllDialogsPageEvent, AllDialogsPageState> {
  AllDialogsPageBloc() : super(AllDialogsPageEmptyState()){
    on<LoadingUserEvent>((event, emit) {
      final users = _getUserContacts('0');
      print(users);
      if (users == null) {
        emit(AllDialogsPageErrorState());
      } else {
        emit(ContactsState(users));
      }
    });
  }

  @override
  Stream<AllDialogsPageState> mapEventToState(
    AllDialogsPageEvent event,
  ) async* {
    if (event is LoadingUserEvent) {
      //TODO: get real user ID
      print("-");
      final users = _getUserContacts('0');
      if (users == null) {
        yield AllDialogsPageErrorState();
      } else {
        yield ContactsState(users);
      }
    }
  }

  List<AllDialogsModel>? _getUserContacts(String userId) {
    //TODO: get real data from server
    return AllDialogsMock.allDialogs;
  }
}
