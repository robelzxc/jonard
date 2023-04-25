import '../Functions/db_helper_and_functions.dart';
import 'package:flutter/material.dart';
import '../Functions/classes.dart';

class FormPage extends StatelessWidget {
  final Todo? todo;
  const FormPage({Key? key,
  this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final dateController = TextEditingController();

    if(todo != null){
      titleController.text = todo!.title;
      descController.text = todo!.description;
      dateController.text = 'Date = ${todo!.date}';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(todo == null ?'Add to do': 'Update to do'),
          centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              keyboardType: TextInputType.multiline,
              onChanged: (str){},
              maxLines: 3,
            ),
            TextFormField(
              controller: dateController,
              decoration: const InputDecoration(
                hintText: 'Date',
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                      final title = titleController.text;
                      final description = descController.text;
                      final date = dateController.text;
                      if(title.isEmpty || description.isEmpty || date.isEmpty){
                        return;
                      }

                      final Todo model = Todo(title: title, description: description, date: date, id: todo?.id);
                      if(todo == null){
                        await dbHelper.addTodo(model);
                        Navigator.pop(context);
                      }else{
                        await dbHelper.updateTodo(model);
                        Navigator.pop(context);
                      }

                  },
                  child: Text(todo == null ? 'Save to do': 'Edit to do'),
                ),
            )
          ],
        ),
      ),
    );
  }
}
