import 'package:shared_preferences/shared_preferences.dart';
import 'package:habbab/models/task.dart';
import 'dart:convert';

Future<void> saveTasks(Map<String, List<Task>> tasks) async {
  final prefs = await SharedPreferences.getInstance();

  final encoded = tasks.map(
    (day, list) => MapEntry(day, list.map((t) => t.toJson()).toList()),
  );
  prefs.setString('tasks', jsonEncode(encoded));
}

Future<Map<String, List<Task>>?> loadTasks() async {
  final prefs = await SharedPreferences.getInstance();
  final tasks = prefs.getString('tasks');
  if (tasks == null) {
    return null;
  }

  final decoded = jsonDecode(tasks) as Map<String, dynamic>;
  return decoded.map<String, List<Task>>(
    (day, list) =>
        MapEntry(day, (list as List).map((t) => Task.fromJson(t)).toList()),
  );
}
