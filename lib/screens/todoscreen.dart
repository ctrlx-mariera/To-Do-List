import 'dart:convert';

import 'package:demo_two/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  bool loading = false;
  List<Todo> todos = [];
  getTodos() async {
    setState(() {
      loading = true;
    });
    var response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    print(response.body);
    List data = jsonDecode(response.body);
    for (var item in data) {
      todos.add(Todo.fromJSON(item));
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Screen'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(10),
              children: todos
                  .map((todo) => Card(
                        child: ListTile(
                          title: Text(todo.title!),
                          leading: CircleAvatar(
                            child: Text(
                              todo.id.toString(),
                            ),
                          ),
                          trailing: Icon(
                            todo.completed! ? Icons.check : Icons.close,
                          ),
                        ),
                      ))
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
