// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/Todo-card.dart';
import 'package:to_do_list/widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class Task {
  String title;
  bool statues;
  Task({required this.title, required this.statues});
}

class _TodoState extends State<Todo> {
  final myController = TextEditingController();

  List allTasks = [
    Task(title: "Publish video", statues: true),
    Task(title: "Drink Water", statues: true),
    Task(title: "Gem", statues: true),
    Task(title: "Go work", statues: true),
  ];

  addNewtask() {
    setState(() {
      allTasks.add(
        Task(title: myControll.text, statues: false),
      );
    });
  }

  final myControll = TextEditingController();
  int nuumberForTask() {
    int completedTasks = 0;
    allTasks.forEach((items) {
      if (items.statues) {
        completedTasks++;
      }
    });

    return completedTasks;
  }

  press(int item) {
    setState(() {
      allTasks[item].statues = !allTasks[item].statues;
    });
  }

  removeTask(int clickDelet) {
    setState(() {
      allTasks.remove(allTasks[clickDelet]);
    });
  }

  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                      padding: EdgeInsets.all(20),
                      height: 200,
                      color: Colors.white60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: myControll,
                            autocorrect: true,
                            maxLength: 30,
                            decoration: InputDecoration(hintText: "Add Text"),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextButton(
                              onPressed: () {
                                addNewtask();
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      )),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 10, 73, 58),
      ),
      backgroundColor: Color.fromRGBO(0, 139, 139, 0.3),
      appBar: AppBar(
        actions: [
          IconButton(
              iconSize: 27,
              onPressed: () {
                deleteAll();
              },
              icon: Icon(Icons.delete_forever_rounded)),
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        title: Text(
          "To Do List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              func: nuumberForTask(),
              allTodos: allTasks.length,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todocard(
                      titles: allTasks[index].title,
                      rightORno: allTasks[index].statues,
                      mypress: press,
                      iii: index,
                      removeTask: removeTask,
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
