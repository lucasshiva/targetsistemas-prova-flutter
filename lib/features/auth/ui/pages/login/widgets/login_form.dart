import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';
import 'filled_form_button.dart';
import 'login_field.dart';
import 'password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController(text: "targetsistemas");
  final _passwordController = TextEditingController(text: "123456789");

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final authCubit = context.read<AuthCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          LoginField(controller: _loginController),
          const SizedBox(height: 18),
          PasswordField(controller: _passwordController),
          const SizedBox(height: 30),
          FilledFormButton(
            width: screenSize.width * 0.4,
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;

              final username = _loginController.text;
              final password = _passwordController.text;
              final accountFound = authCubit.login(username, password);
              if (!accountFound) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(content: Text("Conta não encontrada")));
              }
            },
          ),
        ],
      ),
    );
  }
}
