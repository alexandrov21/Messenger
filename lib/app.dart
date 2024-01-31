import 'package:flutter/material.dart';
import 'package:messenger_app/pages/all_dialogs_page/all_dialogs_page.dart';
import 'package:messenger_app/pages/sign_up_page/sign_up_page.dart';

import 'pages/main_page/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main' : (context ) => const MainPage(),
        '/sign_up' : (context) => const SignUpPage(),
        '/all_dialogs' : (context) => const AllDialogsPage(),
      },
      initialRoute: 'main',
      home: const MainPage(),
    );
  }
}
