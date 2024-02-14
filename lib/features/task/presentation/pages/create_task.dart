import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task/presentation/bloc/bloc/task_bloc.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
   TextEditingController taskName = TextEditingController();
    TextEditingController taskDes = TextEditingController();
      String selectedEmployeeName = "emp1";
        List<DropdownMenuItem<String>> get dropdownEmployeeItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Emp1"), value: "emp1"),
      DropdownMenuItem(child: Text("Emp2"), value: "emp2"),
      DropdownMenuItem(child: Text("Emp3"), value: "emp3"),
      DropdownMenuItem(child: Text("Emp4"), value: "emp4"),
      DropdownMenuItem(child: Text("Emp5"), value: "emp5"),
      
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        
    
        
        
      ),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Name',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.0,
                fontFamily: 'Roboto',
              ),
            ), 
            SizedBox(height: 10,),
             TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  counterText: "",
                  hintText: 'Enter task name',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontFamily: 'Roboto',
                ),
                controller: taskName,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter task name';
                  }
                },
                //onSaved: (val) => fname = val.toString(),
              ),
                SizedBox(height: 10,),
                Text(
              'Task Description',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.0,
                fontFamily: 'Roboto',
              ),
            ), 
            SizedBox(height: 10,),
                 TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  
                  counterText: "",
                  hintText: 'Enter task description',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontFamily: 'Roboto',
                ),
                controller: taskDes,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter task discription';
                  }
                },
                //onSaved: (val) => fname = val.toString(),
              ),
                 SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
              'Select Employee',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.0,
                fontFamily: 'Roboto',
              ),
            ), 
            SizedBox(width: 30,),
                DropdownButton(
                  
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontFamily: 'Roboto',
              ),
              
              dropdownColor: Colors.blueAccent,
              
              value: selectedEmployeeName,
              onChanged: (String? newValue) {
                setState(() {
                  selectedEmployeeName = newValue!;
                  
                });
                print(selectedEmployeeName);
              },
              items: dropdownEmployeeItems,
            ),

                ],
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor:Colors.blue,),
                      onPressed: () {
                        if (taskName.text.isNotEmpty &&
                            taskDes.text.isNotEmpty) {
                          context.read<TaskBloc>().add(
                                AddTask(
                                  title: taskName.text,
                                  description: taskDes.text,
                                  empName: selectedEmployeeName
                                ),
                              );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text("Task added successfully"),
                          ));
                          context.read<TaskBloc>().add(const GetTask());
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "task name and description fields must not be blank"
                                    .toUpperCase()),
                          ));
                        }
                      },
                      child: const Text('SUBMIT',style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
                },
              ),
            
          ],
        ),
      ),
   );
  }
}