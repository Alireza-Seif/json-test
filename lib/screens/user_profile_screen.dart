import 'package:flutter/material.dart';
import 'package:json_test/data/model/user.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key, this.user});

  List<User>? user;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<User>? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user![2].name),
      ),
    );
  }
}
