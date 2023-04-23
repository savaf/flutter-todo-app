import 'package:flutter/material.dart';
// import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController _searchController = TextEditingController();
  final todoList = ToDo.todoList();
  List<ToDo> _filteredTodoList = [];

  @override
  void initState() {
    _filteredTodoList = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(children: [
        Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 0,
                        bottom: 20,
                      ),
                      child: Text(
                        'All ToDos',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    for (ToDo todoItem in _filteredTodoList.reversed)
                      ToDoItem(
                        todoItem: todoItem,
                        onDeleteToDo: (id) {
                          setState(() {
                            _filteredTodoList
                                .removeWhere((item) => item.id == id);
                          });
                        },
                        onToggleToDo: (todoItem) {
                          setState(() {
                            todoItem.isDone = !todoItem.isDone;
                          });
                        },
                      )
                  ]),
                )
              ],
            ))
      ]),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      onPressed: _navigateToCreateToDoPage,
      tooltip: 'Go to create todo page',
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(Icons.add),
    );
  }

  void _navigateToCreateToDoPage() async {
    Navigator.pushNamed(context, '/todo/create').then((result) {
      final todoItem = result as ToDo;
      if (todoItem != null) {
        setState(() {
          _filteredTodoList.add(todoItem);
        });
      }
    });
  }
}
