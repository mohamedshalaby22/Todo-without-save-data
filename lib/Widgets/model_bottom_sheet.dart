// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/task_data.dart';
import 'package:provider/provider.dart';

class ModelBottomSheetData extends StatelessWidget {
  Function? showInputText;
  ModelBottomSheetData({
    Key? key,
    this.showInputText,
  }) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                    color: Colors.deepPurple[400],
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Task';
                  }
                },
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
                cursorColor: Colors.teal[400],
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff26a69a)),
                )),
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          primary: Colors.teal[400],
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print(text.text);
                          }
                          Provider.of<TaskData>(context, listen: false)
                              .addTask(newTaskTitle!);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
