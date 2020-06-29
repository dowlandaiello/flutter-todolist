import 'package:flutter/material.dart';

/// A screen on which a user may add a todo item to the main screen.
class AddTodoPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Todo'),
      ),
      body: Center(
        Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: InputBorder(borderSide: BorderSide.bottom),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  /// Title of the todo item
  final String title;

  /// Description of the todo item
  final String description;

  /// TodoItem has a title and description.
  TodoItem({this.title, this.description});

  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$title',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            Text(
              '$description',
              textAlign: TextAlign.left,
              overflow: TextOverflow.fade,
              style: TextStyle(fontWeight: FontWeight.normal)
            ),
          ],
        ) 
      )
    );
  }
}