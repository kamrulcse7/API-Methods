import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
import '../screens/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ActionChip(
          onPressed: () => logout(),
          label: Text(
            "LogOut",
            style: myTextStyle(18.0, Colors.white, FontWeight.bold),
          ),
          avatar: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          shadowColor: Colors.teal,
          elevation: 10.0,
          backgroundColor: Colors.orange,
          labelPadding: EdgeInsets.only(left: 15.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
      ),
    );
  }
}
