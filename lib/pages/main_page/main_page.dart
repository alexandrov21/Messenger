import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/sign_in_page/sign_in_page_bloc.dart';
import 'package:messenger_app/bloc/sign_in_page/sign_in_page_event.dart';
import 'package:messenger_app/bloc/sign_in_page/sign_in_page_state.dart';

import '../../utils/text_styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _showMyDialog(String errorMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(errorMessage),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInPageBloc>(
      create: (context) => SignInPageBloc(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SignInPageBloc, SignInPageState>(
              builder: (context, state) {
            final bloc = context.read<SignInPageBloc>();
            if (state is UserInfoState) {
              print(state.personalInfo.name);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamed(
                  '/all_dialogs',
                );
              });
            }
            if (state is SignInPageErrorState) {
              bloc.add(ResetEvent());
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _showMyDialog(state.errorMessage);
              });
              print('+');
            }
            return ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 160,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                      ),
                      child: _buildSignInInfo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                      ),
                      child: _buildLogInButton(() {
                        bloc.add(CheckingUserInfoEvent(
                          enteringEmail: _emailController.text,
                          enteringPassword: _passwordController.text,
                        ));
                      }),
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                    _buildSignUpQuestion(),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildSignInInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Login ',
          style: TextStyles.loginText,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Please sign in to continue.',
          style: TextStyles.pleaseContinueText,
        ),
        const SizedBox(
          height: 28,
        ),
        _buildEmailTextField(),
        const SizedBox(
          height: 20,
        ),
        _buildPasswordTextField(),
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'EMAIL',
        labelStyle: TextStyles.textFieldLabelText,
        prefixIcon: Icon(
          Icons.email_outlined,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 1.8,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'PASSWORD',
        labelStyle: TextStyles.textFieldLabelText,
        prefixIcon: Icon(
          Icons.lock_outline,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 1.8,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildLogInButton(VoidCallback onLogInPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DecoratedBox(
          decoration: _buildLogInButtonGradient(),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              onLogInPressed.call();
            },
            child: const Row(
              children: [
                Text(
                  'LOG IN',
                  style: TextStyles.logInButtonText,
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _buildLogInButtonGradient() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Colors.orangeAccent,
          Colors.orange,
        ],
      ),
      borderRadius: BorderRadius.circular(24),
      boxShadow: const <BoxShadow>[
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.57),
            //shadow for button
            blurRadius: 5) //blur radius of shadow
      ],
    );
  }

  Widget _buildSignUpQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyles.helpQuestionText,
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/sign_up',
            );
          },
          child: const Text(
            'Sign up',
            style: TextStyles.helpSignUpButtonText,
          ),
        ),
      ],
    );
  }
}
