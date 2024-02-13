part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class AddTask extends TaskEvent {
  final String title;
  final String description;

  const AddTask(
      {required this.title,
      required this.description,
    });

  @override
  List<Object?> get props =>
      [title,description];
}



class GetTask extends TaskEvent {
  const GetTask();

  @override
  List<Object?> get props => [];
}


class DeleteTask extends TaskEvent {
  final int id;
  const DeleteTask({required this.id});
  @override
  List<Object?> get props => [id];
}
