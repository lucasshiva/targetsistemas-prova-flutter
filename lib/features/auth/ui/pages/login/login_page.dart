import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_gradient_container.dart';
import '../../../../../core/widgets/privacy_policy_text.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppGradientContainer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.all(20),
                child: LoginForm(),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PrivacyPolicyText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
