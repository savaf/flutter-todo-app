import 'package:flutter/material.dart';

import 'package:flutter_todo_app/models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todoItem;
  final Function onDeleteToDo;
  final Function onToggleToDo;

  ToDoItem({
    Key? key,
    required this.todoItem,
    required this.onDeleteToDo,
    required this.onToggleToDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = todoItem.isDone ? 1 : 0;
    final List<IconData> icons = [Icons.circle_outlined, Icons.check_circle];

    void toggleIcon() {
      currentIndex = (currentIndex + 1) % icons.length;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToggleToDo(todoItem);
          toggleIcon();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        // leading: _buildIcon(context),
        leading: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Icon(
            icons[currentIndex],
            key: ValueKey(icons[currentIndex]),
            color: todoItem.isDone
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          todoItem.label.toString().substring(0, 1).toUpperCase() +
              todoItem.label.toString().substring(1),
          style: _buildTextStyle(context),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () => onDeleteToDo(todoItem.id),
          ),
        ),
      ),
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontSize: 18,
          color: todoItem.isDone ? Colors.black38 : Colors.black,
          decoration: todoItem.isDone ? TextDecoration.lineThrough : null,
        );
  }

  Icon _buildIcon(BuildContext context) {
    return Icon(
      todoItem.isDone ? Icons.check_circle : Icons.circle_outlined,
      color: todoItem.isDone
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary,
    );
  }
}
