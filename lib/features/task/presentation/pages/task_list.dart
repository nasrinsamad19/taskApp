import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task/presentation/bloc/bloc/task_bloc.dart';
import 'package:task_app/features/task/presentation/pages/create_task.dart';
import 'package:task_app/utils/screen_constrints.dart';


class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
    final ScrollController _controller = ScrollController();
    var value="";
    var selected='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
      
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'TASK',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontFamily: 'Roboto',
          ),
        ),
        
         actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            tooltip: 'Comment Icon',
            onPressed: () {
               Navigator.push(
              context, MaterialPageRoute(builder: (c) => const CreateTaskPage()));
            },
          ), //IconButton
           //IconButton
        ],
        
        
      ),
      
        body: SingleChildScrollView(
          padding: EdgeInsets.all(40),
        child:BlocConsumer<TaskBloc,TaskState>(
          listener: (context, state) {

          } ,
          builder: (context, state) {
          if(state is TaskInitial){
            context.read<TaskBloc>().add(const GetTask());

          }else if( state is ListTasks){
            return  Container(
                height: 400,
                child: ListView.separated(
                   separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 20,
            ),

                    controller: _controller,
                    itemCount: state.task.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
      child: Container(
        width: width(context) * .85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.zero
          ),
          border: Border.all(color: Colors.blue),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.1,
              ),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              
              Container(
                child: Row(
                  children: [
                    Text('Assigned To :',
                    style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

                    ),
                    SizedBox(width: 5,),
                      Text(state.task[index].empName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text('Task :',
                    style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

                    ),
                    SizedBox(width: 5,),
                      Text(state.task[index].title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
               Container(
                child: Row(
                  children: [
                    Text('Description :',
                    style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

                    ),
                    SizedBox(width: 5,),
                      Text(state.task[index].description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
             
             
            ],
          ),
        ),
      ),
    )
;
                    }),
              )
  ;

          }else{

          }
          return const Center(
            child: Text('NO DATA'),
          );
        })
  
         
            
          
        ),
    );
  }
}