part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

final class TaskInitial extends TaskState {
   @override
  List<Object> get props => [];
}


class ListTasks extends TaskState {
  final List<Task> task;

  const ListTasks({required this.task});
  @override
  List<Object> get props => [task];
}


