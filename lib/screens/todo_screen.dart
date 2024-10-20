import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../widgets/todo_tile.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todos = [];

  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(Todo(
          title: _controller.text,
        ));
        _controller.clear();
      });
    }
  }

  void _deleteTodoAt(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple To-Do App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter To-Do',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addTodo,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todo: _todos[index],
                  onDelete: () => _deleteTodoAt(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

