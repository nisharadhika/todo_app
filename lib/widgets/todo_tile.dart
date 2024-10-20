// lib/widgets/todo_tile.dart

import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final VoidCallback onDelete;

  TodoTile({required this.todo, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (bool? value) {
          todo.toggleCompleted();
        },
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
