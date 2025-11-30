import 'dart:isolate';
import 'dart:developer' as logger;
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
                print(computeHeavyTask1());
              },
              child: Text("Task1"),
            ),
            ElevatedButton(
              onPressed: () async {
                ReceivePort receivePort = ReceivePort();
                await Isolate.spawn(computeHeavyTask, receivePort.sendPort);
                receivePort.listen((result) {
                  logger.log(result.toString());
                });
              },
              child: Text("Task2"),
            ),
          ],
        ),
      ),
    );
  }
}

computeHeavyTask1() {
  int result = 0;
  for (int i = 0; i < 1000000000; i++) {
    result = i;
  }
  return result;
}

computeHeavyTask(SendPort sendPort) {
  int result = 0;
  for (int i = 0; i < 1000000000; i++) {
    result = i;
  }
  sendPort.send(result);
}
