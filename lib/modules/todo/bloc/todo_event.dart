part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoInitialEvent extends TodoEvent {}

class TodoAddEvent extends TodoEvent {
  TodoAddEvent(this.task);
  final Task task;
}

class TodoEditEvent extends TodoEvent {
  TodoEditEvent(this.task);
  final Task task;
}
