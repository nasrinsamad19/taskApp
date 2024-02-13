import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/features/task/data/datasources/local_data_source.dart';
import 'package:task_app/features/task/data/models/task-list.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
        List<Task> tasks = [];

    on<TaskEvent>((event, emit) async {
      if(event is AddTask){
         await DatabaseService.instance.create(
        Task(
          title: event.title,
          description: event.description,
        ),
      ).then((value) => emit);

      } else if( event is GetTask){
        tasks = await DatabaseService.instance.readAllTasks();
      emit(ListTasks(task: tasks));
      } else if (event is DeleteTask){
         await DatabaseService.instance.delete(id: event.id);
      add(const GetTask());
      }
      
    });
  }
 

}
