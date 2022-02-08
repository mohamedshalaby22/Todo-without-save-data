// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
            itemCount: taskdata.tasks.length,
            itemBuilder: (context, index) => TasksTile(
                onPress: () {
                  taskdata.deleteTask(taskdata.tasks[index]);
                },
                isChecked: taskdata.tasks[index].isDone,
                taskTitle: taskdata.tasks[index].name,
                checkBoxChange: (newValue) {
                  taskdata.updateTask(taskdata.tasks[index]);
                }));
      },
    );
  }
}

class TasksTile extends StatelessWidget {
  final bool isChecked;
  String taskTitle;
  void Function(bool?) checkBoxChange;
  void Function() onPress;

  TasksTile({
    Key? key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkBoxChange,
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: onPress,
        leading: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: Colors.teal[400],
            value: isChecked,
            onChanged: checkBoxChange));
  }
}
