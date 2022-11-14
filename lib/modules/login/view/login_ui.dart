import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/login_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginUI(),
    );
  }
}

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.loginDTO == null) {
            return Center(
              child: IconButton(
                icon: const Icon(Icons.mail),
                onPressed: () {
                  context.read<LoginBloc>().add(const GoogleLogin());
                },
              ),
            );
          } else {
            return Column(
              children: [
                Text(state.loginDTO?.name ?? ''),
                Text(state.loginDTO?.email ?? ''),
                Text(state.loginDTO?.uid ?? ''),
              ],
            );
          }
        },
      ),
    );
  }
}
