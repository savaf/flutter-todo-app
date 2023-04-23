class ToDo {
  String? id;
  String? label;
  bool isDone;

  ToDo({
    required this.id,
    required this.label,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', label: 'Morning Excercise', isDone: true),
      ToDo(id: '02', label: 'Buy Groceries', isDone: true),
      ToDo(
        id: '03',
        label: 'Check Emails',
      ),
      ToDo(
        id: '04',
        label: 'Team Meeting',
      ),
      ToDo(
        id: '05',
        label: 'Work on mobile apps for 2 hour',
      ),
      ToDo(
        id: '06',
        label: 'Dinner with Jenny',
      ),
    ];
  }
}
