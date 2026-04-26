import 'package:flutter/material.dart';
import 'package:habbab/models/task.dart';
import 'package:habbab/widgets/task_card.dart';

class DayColumn extends StatelessWidget {
  final String day;
  final List<Task> tasks;
  final void Function(int index) onDelete;
  final void Function(int index) onToggle;
  const DayColumn({
    super.key,
    required this.day,
    required this.tasks,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, i) {
                return TaskCard(
                  task: tasks[i],
                  onDelete: () => onDelete(i),
                  onToggle: () => onToggle(i),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
