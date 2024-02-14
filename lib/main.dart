import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task/presentation/bloc/bloc/task_bloc.dart';
import 'package:task_app/features/task/presentation/pages/task_list.dart';


void main() {
   WidgetsFlutterBinding.ensureInitialized();
   
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> TaskBloc())

      ], child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white
        ),
        home: const TaskListPage(),

      ));
  }
}

