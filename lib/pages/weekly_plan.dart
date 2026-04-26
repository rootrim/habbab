import 'package:flutter/material.dart';
import 'package:habbab/models/task.dart';
import 'package:habbab/widgets/day_column.dart';

class WeeklyPlanScreen extends StatefulWidget {
  const WeeklyPlanScreen({super.key});

  @override
  State<WeeklyPlanScreen> createState() => WeeklyPlanScreenState();
}

class WeeklyPlanScreenState extends State<WeeklyPlanScreen> {
  final Map<String, List<Task>> _tasks = {
    'Monday': [],
    'Tuesday': [],
    'Wednesday': [],
    'Thursday': [],
    'Friday': [],
    'Saturday': [],
    'Sunday': [],
  };

  void _deleteTask(String day, int index) {
    setState(() {
      _tasks[day]!.removeAt(index);
    });
  }

  void _toggleTask(String day, int index) {
    setState(() {
      _tasks[day]![index].toggle();
    });
  }

  void addTask(String day, String title) {
    setState(() {
      _tasks[day]!.add(
        Task(id: DateTime.now().millisecondsSinceEpoch, title: title),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
