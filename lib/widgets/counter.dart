import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTodos;
  final int func;

  Counter({Key? key, required this.allTodos, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Text(
        '$func/$allTodos',
        style: TextStyle(
            fontSize: 39,
            color: allTodos == func
                ? Colors.green
                : Color.fromARGB(255, 145, 16, 48),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
