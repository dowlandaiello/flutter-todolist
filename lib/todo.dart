import 'package:flutter/material.dart';

/// A form through which a user can create a new TodoItem.
class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() {
    return _TodoFormState();
  }
}

class _TodoFormData {
  /// The title of the todo item
  String title = '';

  /// The description of the todo item
  String description = '';
}

/// The state of a newTodo form.
class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  _TodoFormData _data = _TodoFormData();

  /// Generates a validator for some form field.
  final _validatorForTodoField = (String field) => (String value) {
        if (value.isEmpty) {
          return 'Your todo must have a $field.';
        }

        return null;
      };

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
              validator: _validatorForTodoField('title'),
              onSaved: (String value) {
                _data.title = value;
              }),
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Todo Description',
              ),
              validator: _validatorForTodoField('description'),
              onSaved: (String value) {
                _data.description = value;
              }),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context,
                  TodoItem(title: _data.title, description: _data.description));
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
