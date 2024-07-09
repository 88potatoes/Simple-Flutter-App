import 'package:flutter/material.dart';

class My_TextField extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obscureText;
  const My_TextField({super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText,});


  @override
  Widget build(BuildContext context){
    return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  obscureText: obscureText,
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    icon: Icon(obscureText ? Icons.lock : Icons.person),
                    //labelText: 'Username',
                    hintText: hintText,
                  ),
                ),
              );
  }
}