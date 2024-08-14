import 'package:aula_app_2/Screens/form_screnn.dart';
import 'package:aula_app_2/data/task_inherited.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).listTask,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contextNew) => FormScreen(
                          taskContext: context,
                        )));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
