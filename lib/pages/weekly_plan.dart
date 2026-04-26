import 'package:flutter/material.dart';
import 'package:habbab/models/task.dart';
import 'package:habbab/services/storage.dart';
import 'package:habbab/widgets/day_column.dart';

class WeeklyPlanScreen extends StatefulWidget {
  const WeeklyPlanScreen({super.key});

  @override
  State<WeeklyPlanScreen> createState() => WeeklyPlanScreenState();
}

class WeeklyPlanScreenState extends State<WeeklyPlanScreen> {
  late Map<String, List<Task>> _tasks;
  var _tasksLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final tasks = await loadTasks();
    setState(() {
      _tasks =
          tasks ??
          {
            'Monday': [],
            'Tuesday': [],
            'Wednesday': [],
            'Thursday': [],
            'Friday': [],
            'Saturday': [],
            'Sunday': [],
          };
      _tasksLoaded = true;
    });
  }

  void _deleteTask(String day, int index) {
    setState(() {
      _tasks[day]!.removeAt(index);
      saveTasks(_tasks);
    });
  }

  void _toggleTask(String day, int index) {
    setState(() {
      _tasks[day]![index].toggle();
      saveTasks(_tasks);
    });
  }

  void addTask(String day, String title) {
    setState(() {
      _tasks[day]!.add(
        Task(id: DateTime.now().millisecondsSinceEpoch, title: title),
      );
      saveTasks(_tasks);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_tasksLoaded) return const CircularProgressIndicator();
    return ListView(
      scrollDirection: Axis.horizontal,
      children: _tasks.entries.map((entry) {
        return DayColumn(
          day: entry.key,
          tasks: entry.value,
          onDelete: (i) => _deleteTask(entry.key, i),
          onToggle: (i) => _toggleTask(entry.key, i),
        );
      }).toList(),
    );
  }
}
