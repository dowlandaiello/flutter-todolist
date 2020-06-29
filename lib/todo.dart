import 'package:flutter/material.dart';

/// A form through which a user can create a new TodoItem.
class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() {
    return _TodoFormState();
  }
}

/// The state of a newTodo form.
class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        Form.of(primaryFocus.context).save();
      },
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Todo Title',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Todo Description',
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context, TodoItem(title: ));
            },
            child: Text('Create Todo'),
          )
        ],
      ),
    );
  }
}

/// A screen on which a user may add a todo item to the main screen.
class AddTodoPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Todo'),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(12.0),
        child: TodoForm(),
      )),
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
                Text('$title',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('$description',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            )));
  }
}
