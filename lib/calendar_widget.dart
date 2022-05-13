library calendar_widget;

import 'package:calendar_logic/calendar_logic.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final calendarData = CalendarBuilder().build(date);

    return Column(
      children: [
        const _WeekLabelRow(),
        ...calendarData.map((week) => _Week(week)),
      ],
    );
  }
}

class _WeekLabelRow extends StatelessWidget {
  const _WeekLabelRow({super.key});

  @override
  Widget build(BuildContext context) {
    const weekLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      children: List.generate(
        weekLabels.length,
        (index) => Expanded(
          child: _DateBox(
            weekLabels[index],
            color: index == 5
                ? Colors.blue.shade50
                : index == 6
                    ? Colors.red.shade50
                    : Colors.white,
          ),
        ),
      ).toList(),
    );
  }
}

class _Week extends StatelessWidget {
  const _Week(
    this.datesOfWeek, {
    super.key,
  });

  final List<int?> datesOfWeek;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        datesOfWeek.length,
        (index) => Expanded(
          child: _DateBox(
            '${datesOfWeek[index] ?? ''}',
            color: index == 5
                ? Colors.blue.shade50
                : index == 6
                    ? Colors.red.shade50
                    : Colors.white,
          ),
        ),
      ).toList(),
    );
  }
}

class _DateBox extends StatelessWidget {
  const _DateBox(
    this.label, {
    required this.color,
    super.key,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          color: color,
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
