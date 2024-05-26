import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/todo_model.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoAddIconPressed>((event, emit) {
      final updatedList = List<ToDoModel>.from(state.list)
        ..add(
            ToDoModel(title: event.title, dateTime: DateTime.now().toString()));
      emit(TodoUpdated(list: updatedList));
    });
  }
}
