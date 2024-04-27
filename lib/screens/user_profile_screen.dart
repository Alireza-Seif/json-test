import 'package:flutter/material.dart';
import 'package:json_test/data/model/user.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key, this.user});

  List<User>? user;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<User>? userList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userList = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: userList!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              height: 80,
              color: Colors.blueAccent,
              child: Center(
                  child: Text(
                userList![index].name,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              )),
            );
          },
        ),
      ),
    );
  }
}
