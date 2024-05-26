part of 'todo_cubit.dart';

sealed class TodoState {
  List<ToDoModel> list;
  TodoState({required this.list});
}

final class TodoInitial extends TodoState {
  TodoInitial() : super(list: []);
}

final class TodoUpdated extends TodoState {
  TodoUpdated({required super.list});
}
