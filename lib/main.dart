import 'package:bloc_practices/bloc/auth_bloc.dart';
import 'package:bloc_practices/bloc/todo_bloc.dart';
import 'package:bloc_practices/cubit/todo_cubit.dart';
import 'package:bloc_practices/features/home_screen.dart';
import 'package:bloc_practices/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => AuthBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
