import 'package:bloc_practices/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(state.list[index].title),
                );
              }));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoBloc>().add(TodoAddIconPressed(title: "Hello"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
