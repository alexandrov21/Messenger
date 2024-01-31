import 'package:flutter/material.dart';

import '../../utils/text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28,),
                      child: _buildCreateAccountInfo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28,),
                      child: _buildSignUpButton(),
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
        ),
      ),
    );
  }

  Widget _buildCreateAccountInfo(){
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

  Widget _buildFullNameTextField(){
    return const TextField(
      decoration: InputDecoration(
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

  Widget _buildEmailTextField(){
    return const TextField(
      decoration: InputDecoration(
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

  Widget _buildPasswordTextField(){
    return const TextField(
      decoration: InputDecoration(
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

  Widget _buildConfirmTextField(){
    return const TextField(
      decoration: InputDecoration(
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

  Widget _buildSignUpButton(){
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
            onPressed: () {},
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

  BoxDecoration _buildSignUpButtonGradient(){
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

  Widget _buildSignInQuestion(){
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

  Widget _buildPositionedBackButton(){
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
}
