import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String title = 'loading...';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 28),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: const Text(
                    'click to get data',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getData() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

    Response response = await get(uri);
    setState(() {
       title = jsonDecode(response.body)['title'];
    });
  }
}
