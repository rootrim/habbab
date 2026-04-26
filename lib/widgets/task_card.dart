import 'package:flutter/material.dart';
import 'package:habbab/models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggle;
  const TaskCard({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDelete,
      onTap: onToggle,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            task.title,
            style: TextStyle(
              fontSize: 16,
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }
}
