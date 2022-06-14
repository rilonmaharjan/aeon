import 'package:attendance/view/scan_code.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aeon Class Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Color.fromARGB(62, 238, 50, 84),
        selectionHandleColor: Color(0xffEE3253),
      )),
      home: const ScanCode(),
    );
  }
}
