import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/sign_up_page/sign_up_page_state.dart';
import 'package:messenger_app/users_auth/firebase_auth_implementation/firebase_auth_services.dart';

import '../../bloc/sign_up_page/sign_up_page_bloc.dart';
import '../../bloc/sign_up_page/sign_up_page_event.dart';
import '../../utils/text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
    return BlocProvider<SignUpPageBloc>(
      create: (context) => SignUpPageBloc(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SignUpPageBloc, SignUpPageState>(
            builder: (context, state) {
              final bloc = context.read<SignUpPageBloc>();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (state is UserFullInfoState) {
                  Navigator.of(context).pushNamed(
                    '/all_dialogs',
                  );
                }
                if (state is SignUpPageErrorState) {
                  bloc.add(ResetEvent());

                  _showMyDialog(state.errorMessage);

                  print('+');
                }
              });
              return ListView(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                            ),
                            child: _buildCreateAccountInfo(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                            ),
                            child: _buildSignUpButton(() {
                              bloc.add(CheckingFullUserInfoEvent(
                                enteringFullName: _fullNameController.text,
                                enteringEmail: _emailController.text,
                                enteringPassword: _passwordController.text,
                                enteringConfirmPassword:
                                    _confirmPasswordController.text,
                              ));

                            }),
                          ),
                          const SizedBox(
                            height: 84,
                          ),
                          _buildSignInQuestion(),
                        ],
                      ),
                      _buildPositionedBackButton(),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create Account',
          style: TextStyles.createAccountText,
        ),
        const SizedBox(
          height: 28,
        ),
        _buildFullNameTextField(),
        const SizedBox(
          height: 20,
        ),
        _buildEmailTextField(),
        const SizedBox(
          height: 20,
        ),
        _buildPasswordTextField(),
        const SizedBox(
          height: 20,
        ),
        _buildConfirmTextField(),
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }

  Widget _buildFullNameTextField() {
    return TextField(
      controller: _fullNameController,
      decoration: const InputDecoration(
        labelText: 'FULL NAME',
        labelStyle: TextStyles.textFieldLabelText,
        prefixIcon: Icon(
          Icons.person_outline,
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

  Widget _buildConfirmTextField() {
    return TextField(
      controller: _confirmPasswordController,
      decoration: const InputDecoration(
        labelText: 'CONFIRM PASSWORD',
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

  Widget _buildSignUpButton(VoidCallback onSignUpPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DecoratedBox(
          decoration: _buildSignUpButtonGradient(),
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
              onSignUpPressed.call();
              _signUp();

            },
            child: const Row(
              children: [
                Text(
                  'SIGN UP',
                  style: TextStyles.signUpButtonText,
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

  BoxDecoration _buildSignUpButtonGradient() {
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

  Widget _buildSignInQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyles.helpQuestionText,
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/main',
            );
          },
          child: const Text(
            'Sign in',
            style: TextStyles.helpSignInButtonText,
          ),
        ),
      ],
    );
  }

  Widget _buildPositionedBackButton() {
    return Positioned(
      top: 8,
      left: 8,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/main',
          );
        },
        icon: const Icon(
          Icons.keyboard_backspace_outlined,
          color: Colors.black,
        ),
      ),
    );
  }

  void _signUp() async {

    User? user = await _auth.signUpWithEmailAndPassword('alex@gmail.com', '12345Aa');
  }

}
