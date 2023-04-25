import 'package:basic_app_v2/Pages/Page2Profile.dart';

import 'form_page.dart';
import 'package:flutter/material.dart';
import '../Functions/db_helper_and_functions.dart';
import '../Functions/classes.dart';
import '../Widgets/todo_widget.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text("NoteToDo"),
            centerTitle: true,
            leading: ElevatedButton(onPressed: () async {
                var res = await Navigator.push(context, MaterialPageRoute(builder: (context) => Profile2()));
              }, child: Icon(Icons.account_box)),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FormPage()));
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List<Todo>?>(
          future: dbHelper.getAllTodo(),
          builder: (context, AsyncSnapshot<List<Todo>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
                if (snapshot != null) {
                return ListView.builder(
                  itemBuilder: (context, index) => TodoWidget(
                    todo: snapshot.data![index],
                    onTap: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FormPage(todo: snapshot.data![index],)));
                      setState(() {});
                    },
                    onLongPress: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:
                              const Text('Are you sure u want to delete?'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () async {
                                    await dbHelper
                                        .deleteTodo(snapshot.data![index]);
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: const Text('Yes'),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  itemCount: snapshot.data!.length,
                );
              }
              else return Center(
                child: Text('No to do',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}

