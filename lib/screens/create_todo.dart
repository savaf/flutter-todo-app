// Screen to add a new todo
// Path: lib/screens/add_todo.dart

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/models/todo.dart';

class CreateToDoPage extends StatefulWidget {
  const CreateToDoPage({super.key});

  @override
  State<CreateToDoPage> createState() => _CreateToDoPageState();
}

class _CreateToDoPageState extends State<CreateToDoPage> {
  final _todoLabelTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          controller: _todoLabelTextFieldController,
          decoration: InputDecoration(
            labelText: 'Create a new todo',
            labelStyle: Theme.of(context).textTheme.headlineLarge,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        OutlinedButton(
          onPressed: () => Navigator.maybePop(context),
          style: OutlinedButton.styleFrom(
            shape: const CircleBorder(),
            side: BorderSide(
              color: dividerColor,
              width: 2,
            ),
          ),
          child: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: _saveToDoAndNavigateToHomePage,
      tooltip: 'Save new task',
      backgroundColor: Theme.of(context).colorScheme.primary,
      label: const Text('Save'),
      icon: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  void _saveToDoAndNavigateToHomePage() {
    final todo = ToDo(
      id: DateTime.now().toString(),
      label: _todoLabelTextFieldController.text,
    );

    // Save todo to database
    // ...

    // Navigate back to home page and pass the saved todo
    Navigator.pop(context, todo);
  }
}
