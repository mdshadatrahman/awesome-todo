import 'dart:async';

import 'package:awesome_todo/app/models/task_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoInitialEvent>(todoInitialEvent);
    on<TodoAddEvent>(todoAddEvent);
    on<TodoEditEvent>(todoEditEvent);
  }

  List<Task> tasks = [];

  FutureOr<void> todoInitialEvent(
    TodoInitialEvent event,
    Emitter<TodoState> emit,
  ) {
    emit(TodoLoading());
    tasks.addAll([
      const Task(
        id: 1,
        title: 'Training at the Gym',
        isCompleted: true,
      ),
      const Task(
        id: 2,
        title: 'Play Paddle with friends',
        isCompleted: false,
      ),
      const Task(
        id: 3,
        title: 'Burger BBQ with family',
        isCompleted: false,
      ),
    ]);
    emit(TodoLoaded(tasks));
  }

  FutureOr<void> todoAddEvent(TodoAddEvent event, Emitter<TodoState> emit) {
    emit(TodoLoading());
    tasks.add(event.task);
    emit(TodoLoaded(tasks));
  }

  FutureOr<void> todoEditEvent(TodoEditEvent event, Emitter<TodoState> emit) {
    emit(TodoLoading());
    tasks = tasks.map((task) {
      if (task.id == event.task.id) {
        return event.task;
      }
      return task;
    }).toList();
    emit(TodoLoaded(tasks));
  }
}
