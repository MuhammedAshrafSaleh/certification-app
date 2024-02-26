import 'package:certifications/app/core/app_theme.dart';
import 'package:certifications/app/login_system/login.dart';
import 'package:flutter/material.dart';

import 'app/admin_screen/admin_login.dart';
import 'app/login_system/register.dart';

void main() {
  runApp(const CertificationApp());
}

class CertificationApp extends StatelessWidget {
  const CertificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        AdminLogin.routeName: (context) => AdminLogin(),
      },
    );
  }
}
