import 'package:flutter/material.dart';
import 'package:test/home_page.dart';
import 'package:test/print_page/print_page_finished.dart';
import 'package:test/print_page/print_page_start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PrintPageFinished(),
    );
  }
}
