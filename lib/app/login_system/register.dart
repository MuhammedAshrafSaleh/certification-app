import 'package:certifications/app/login_system/login.dart';
import 'package:flutter/material.dart';

import '../core/regex.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_text_btn.dart';
import '../widgets/custom_textform.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const routeName = 'RegisterScreen';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(
                  'Welcome back! Glad to see you, Again!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: _usernameController,
                        text: 'Username',
                        hasIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: _emailController,
                        text: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        hasIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegEx.validateEmail(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: _passwordController,
                        text: 'Password',
                        hasIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: _confirmedPasswordController,
                        text: 'Confirm Password',
                        hasIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextButton(
                        text: 'Agree and Register',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(_usernameController.text);
                            print(_emailController.text);
                            print(_passwordController.text);
                            print(_confirmedPasswordController.text);
                            _usernameController.clear();
                            _emailController.clear();
                            _confirmedPasswordController.clear();
                            _passwordController.clear();
                          }
                        },
                      ),
                      // const SizedBox(height: 5),
                      CustomBtn(
                          text1: 'Already have account',
                          text2: 'Login now',
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
