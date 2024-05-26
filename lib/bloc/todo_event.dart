part of 'todo_bloc.dart';

sealed class TodoEvent {}

class TodoAddIconPressed extends TodoEvent {
  final String title;
  TodoAddIconPressed({required this.title});
}
