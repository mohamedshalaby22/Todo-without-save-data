import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/models/model.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
