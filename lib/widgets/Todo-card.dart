// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Todocard extends StatelessWidget {
  final String titles;
  final bool rightORno;
  final Function mypress;
  final int iii;
  final Function removeTask;
  const Todocard(
      {Key? key,
      required this.titles,
      required this.rightORno,
      required this.iii,
      required this.removeTask,
      required this.mypress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        mypress(iii);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color.fromRGBO(176, 196, 222, 0.5),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titles,
                style: TextStyle(
                    color: rightORno ? Colors.white : Colors.black,
                    fontSize: 22,
                    decoration: rightORno
                        ? TextDecoration.none
                        : TextDecoration.lineThrough),
              ),
              Row(
                children: [
                  Icon(
                    rightORno ? Icons.check : Icons.close,
                    color: rightORno ? Colors.green : Colors.red,
                    size: 25,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  IconButton(
                    onPressed: () {
                      removeTask(iii);
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 27,
                    color: Color.fromARGB(135, 218, 6, 6),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
