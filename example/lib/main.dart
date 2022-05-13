import 'package:calendar_widget/calendar_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _currentDate;

  @override
  void initState() {
    _currentDate = DateTime.now();
    super.initState();
  }

  void _toNextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
  }

  void _toPreviousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: _toPreviousMonth,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.navigate_before),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child:
                          Text('${_currentDate.year}年 ${_currentDate.month}月'),
                    ),
                  ),
                  InkWell(
                    onTap: _toNextMonth,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.navigate_next),
                    ),
                  ),
                ],
              ),
              Calendar(date: _currentDate),
            ],
          ),
        ),
      ),
    );
  }
}
