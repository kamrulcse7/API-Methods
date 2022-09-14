import 'dart:convert';

import 'package:e_commerce_app_with_api/const.dart';
import 'package:e_commerce_app_with_api/pages/bottom_nav_page.dart';
import 'package:e_commerce_app_with_api/pages/home_page.dart';
import 'package:e_commerce_app_with_api/services/api_service.dart';
import 'package:e_commerce_app_with_api/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool isLoading = false;

  @override
  void initState() {
    isLogin();
    super.initState();
  }

  isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavPage(),
        ),
      );
    }
  }

  getLogin() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        isLoading = true;
      });
      final result = await ApiService.login(
        _emailController.text,
        _passwordController.text,
      );
      setState(() {
        isLoading = false;
      });
      final data = jsonDecode(result);
      if (data['access_token'] != null) {
        setState(() {
          sharedPreferences.setString('token', data["access_token"]);
          // sharedPreferences.setString('email', _emailController.text);
          // sharedPreferences.setString('password', _passwordController.text);
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => BottomNavPage(),
          ),
        );
      }
      print("${data}");
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[50],
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          blur: 1,
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
          child: Container(
            padding: EdgeInsets.all(12.0),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LogIn",
                  style: myTextStyle(40.0, Colors.orange, FontWeight.bold),
                ),
                SizedBox(
                  height: 50.0,
                ),
                CustomTextField(
                  obscureText: false,
                  hintText: "Enter Your Email",
                  controller: _emailController,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black54,
                  ),
                ),
                CustomTextField(
                  hintText: "Enter Password",
                  controller: _passwordController,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black54,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(_isObscure == true
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  obscureText: _isObscure,
                ),
                MaterialButton(
                  onPressed: () {
                    getLogin();
                  },
                  color: Colors.teal,
                  minWidth: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Text(
                    "Log In",
                    style: myTextStyle(
                      20.0,
                      Colors.white,
                      FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
