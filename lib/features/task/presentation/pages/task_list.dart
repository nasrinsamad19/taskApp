import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task/presentation/bloc/bloc/task_bloc.dart';


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
      body: SingleChildScrollView(
        child:BlocBuilder<TaskBloc,TaskState>(builder: (context, state) {
          if(state is TaskInitial){
            return const CircularProgressIndicator(
                        color: Colors.blue,);

          }else if( state is ListTasks){
            return Container(
               // height: height / 2,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 15);
                    },
                    controller: _controller,
                    itemCount: state.task.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                        onChanged: (value) {
                        },
                        tileColor: Colors.white12,
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 10, bottom: 10, top: 10),
                        value: index,
                        selectedTileColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                              color:  Colors.blue),
                        ),
                        activeColor: Colors.blue,
                        groupValue: value,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.task[index].title,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                )),
                            // Text(
                            //     dataList[index].licensePlate,
                            //     style: TextStyle(
                            //         color:
                            //         ColorNames().blue,
                            //         fontSize: 12,
                            //         fontFamily: 'Roboto',)),
                          ],
                        ),
                        //subtitle: Text("caption/subtext"),
                        secondary: Text('Level',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              fontFamily: 'Roboto',
                            )),
                        toggleable: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      );
                    }),
              );

          }else{

          }
          return Center(
            child: Text('NO DATA'),
          );
        })
  
         
            
          
        ),
    );
  }
}