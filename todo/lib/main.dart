import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'To Do app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoModel> toDoItems = [];
  final String todoPrefKey = 'todo_shared_pref_key';
  String newTodo = '';
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? const CircularProgressIndicator()
              : toDoItems.isEmpty
                  ? const Center(
                      child: Text(
                        'No todo\'s added yet.',
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: toDoItems.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: toDoItems[index].status ==
                                      ToDoStatus.completed,
                                  onChanged: (value) {
                                    updateToDo(value ?? false, index);
                                  },
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      toDoItems[index].title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decorationThickness: 2.0,
                                        decoration: toDoItems[index].status ==
                                                ToDoStatus.completed
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                              'created at ${DateFormat('MMMM d, HH:mm').format(toDoItems[index].date)}'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    removeFromPref(index);
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter todo  here',
                      ),
                      onChanged: (value) {
                        newTodo = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final todo = TodoModel(
                        title: newTodo,
                        status: ToDoStatus.pending,
                        date: DateTime.now(),
                      );
                      saveToPrefs(todo);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add todo',
        child: const Icon(Icons.add),
      ),
    );
  }

  toDoSavedSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Todo added successfully!!'),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.of(context).pop();
    loadFromPrefs();
  }

  Future<void> saveToPrefs(TodoModel item) async {
    final prefs = await SharedPreferences.getInstance();
    var todoStrings = prefs.getStringList(todoPrefKey)?.toList();
    todoStrings ??= [];
    todoStrings.add(json.encode(item));
    await prefs.setStringList(todoPrefKey, todoStrings );
    toDoSavedSnackbar();
  }

  Future<void> updateToPrefs(List<TodoModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final todoStrings = items.map((todo) => jsonEncode(todo.toJson())).toList();

    await prefs.setStringList(todoPrefKey, todoStrings);
    setState(() {
      toDoItems = items;
    });
  }

  Future<void> removeFromPref(int index) async {
    toDoItems.removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    final todoStrings =
        toDoItems.map((todo) => jsonEncode(todo.toJson())).toList();

    await prefs.setStringList(todoPrefKey, todoStrings);
    setState(() {});
    removeSnackbar();
  }

  removeSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Todo Removed successfully!!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> updateToDo(bool value, int index) async {
    final list = toDoItems.toList();
    list[index].status = value ? ToDoStatus.completed : ToDoStatus.pending;
    updateToPrefs(list);
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final toDoList = prefs.getStringList(todoPrefKey);

    List<TodoModel> items = [];
    if (toDoList != null) {
      for (var element in toDoList) {
        final item = json.decode(element);
        final todoItem = TodoModel.fromJson(item);

        items.add(todoItem);
      }
    }
    print('TO DO ITEMS SIZE ${items.length}');
    setState(() {
      isLoading = false;
      toDoItems = items;
    });
  }
}
