import 'package:bloc_practices/bloc/auth_bloc.dart';
import 'package:bloc_practices/login_screen.dart';
import 'package:bloc_practices/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLoginHomeScreen extends StatefulWidget {
  const MyLoginHomeScreen({super.key});

  @override
  State<MyLoginHomeScreen> createState() => _MyLoginHomeScreenState();
}

class _MyLoginHomeScreenState extends State<MyLoginHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }

          if (state is AuthSuccess) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text((state as AuthSuccess).uid),
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogOutRequested());
                    },
                    buttonName: "SignOut",
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
