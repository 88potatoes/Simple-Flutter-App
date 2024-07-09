import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vic_hack_mobile/components/signin_button.dart';
import 'package:vic_hack_mobile/components/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void userSignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameController.text, password: passwordController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[700],
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Matcher',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 1.0,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 1.0,
                          color: Color.fromARGB(125, 0, 0, 255)),
                    ]),
              ),
              const SizedBox(height: 20),
              My_TextField(controller: usernameController, hintText: 'Enter Username', obscureText: false),
              const SizedBox(height: 10),
              My_TextField(controller: passwordController, hintText: 'Enter Password', obscureText: true),
              const SizedBox(height: 10),
              const Text('Forgot Password?', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 30),
              SigninButton(onTap: userSignIn,),
            ],
          )),
        ));
  }
}
