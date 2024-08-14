import 'package:aula_app_2/Components/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType();
    assert(result != null, 'ncisbcis');
    return result!;
  }

  final List<Task> listTask = [
    Task("Aprender Flutter",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 4),
    Task(
        "Meditar",
        "https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg",
        5),
    Task("Estudar",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 2),
    Task("Jogar Vôlei",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 1),
    Task("Aprender Flutter na alura com o Kako",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 3),
    Task("Trabalhar",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large", 5),
  ];

  includeTask(String name, int difficulty, String photo) {
    listTask.add(Task(name, photo, difficulty));
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.listTask.length != listTask.length;
  }
}
