import 'package:authentication_repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/login/cubit/login_cubit.dart';
import 'package:flutter_firebase_app/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn...'),
      ),
      body: BlocProvider(
        create: (_) => LoginCubit(
          context.read<AuthenticationRepository>(),
        ),
        child: const LoginForm(),
      ),
    );
  }
}
