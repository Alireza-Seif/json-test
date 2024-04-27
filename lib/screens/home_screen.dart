import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_test/data/model/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:json_test/screens/user_profile_screen.dart';

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
    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/users');

    List<User> userList = response.data
        .map<User>(
          (jsonMapObject) => User.fromMapJson(jsonMapObject),
        )
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfileScreen(
          user: userList,
        ),
      ),
    );
  }
}
