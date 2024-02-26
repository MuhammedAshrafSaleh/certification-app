import 'package:certifications/app/login_system/login.dart';
import 'package:flutter/material.dart';

import '../core/regex.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_text_btn.dart';
import '../widgets/custom_textform.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});
  static const routeName = 'AdminLoginScreen';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  'Admin Login',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                        hasIcon: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextButton(
                        text: 'Login',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(_emailController.text);
                            print(_passwordController.text);
                            _emailController.clear();
                            _passwordController.clear();
                          }
                        },
                      ),
                      CustomBtn(
                          text1: 'Not an admin',
                          text2: 'Login as user',
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          }),
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
