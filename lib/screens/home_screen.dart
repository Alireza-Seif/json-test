import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:json_test/data/model/user.dart';
import 'package:json_test/screens/user_profile_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = 'loading...';
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: const SafeArea(
        child: Center(
          child: SpinKitSpinningLines(
            color: Colors.blue,
            size: 80.0,
          ),
        ),
      ),
    );
  }

  void getData() async {
    // var uri = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

    // Response response = await get(uri);
    // int id = jsonDecode(response.body)['id'];
    // String name = jsonDecode(response.body)['name'];
    // String username = jsonDecode(response.body)['username'];
    // String city = jsonDecode(response.body)['address']['city'];
    // String phone = jsonDecode(response.body)['phone'];

    // User user = User(id, name, username, city, phone);
    var response = await Dio().get('https://jsonplaceholder.typicode.com/users/1');
    print(response.data['name']);

    var jsonMapObject = response.data;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => UserProfileScreen(
    //       user: user,
    //     ),
    //   ),
    // );
  }
}
