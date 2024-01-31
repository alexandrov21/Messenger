import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/app.dart';
import 'package:messenger_app/bloc/all_dialogs_page/all_dialogs_page_state.dart';
import 'package:messenger_app/mocks/all_dialogs_mock.dart';

import '../../bloc/all_dialogs_page/all_dialogs_page_bloc.dart';
import '../../bloc/all_dialogs_page/all_dialogs_page_event.dart';

class AllDialogsPage extends StatefulWidget {
  const AllDialogsPage({Key? key}) : super(key: key);

  @override
  State<AllDialogsPage> createState() => _AllDialogsPageState();
}

class _AllDialogsPageState extends State<AllDialogsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllDialogsPageBloc>(
      create: (context) => AllDialogsPageBloc(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
          title: const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: 44),
              child: Text('Chats'),
            ),
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AllDialogsPageBloc, AllDialogsPageState>(
      builder: (context, state) {
        final bloc = context.read<AllDialogsPageBloc>();
        print(state);
        if (state is AllDialogsPageEmptyState) {
          bloc.add(LoadingUserEvent(userId: '0'));
        }
        if (state is ContactsState) {
          return SafeArea(
            child: ListView(
              children: [
                Column(
                  children: state.users.map(
                    (dialogs) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: dialogs.color,
                              ),
                              child: Text(dialogs.avatar),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(dialogs.name),
                                    Text(dialogs.lastMessage),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
