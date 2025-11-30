import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isolates", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/animation.gif'),
            ElevatedButton(
              onPressed: () {
                print(computeHeavyTask());
              },
              child: Text("Task1"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Task2")),
          ],
        ),
      ),
    );
  }
}

computeHeavyTask() {
  late int result;
  for (int i = 0; i < 10000000000; i++) {
    result = i;
  }
  ;
  return result;
}
