import 'package:bloc_practices/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  void addTodo({required String title}) {
    final updateList = List<ToDoModel>.from(state.list)
      ..add(ToDoModel(title: title, dateTime: DateTime.now().toString()));
    emit(TodoUpdated(list: updateList));
  }

  @override
  void onChange(Change<TodoState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
