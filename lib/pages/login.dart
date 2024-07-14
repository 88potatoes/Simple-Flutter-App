// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 238, 219, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: 20),
              Text(
              'Welcome back!',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 30
                ),
              ),
              SizedBox(height: 5),
              Text(
              'This is a simple login page.',
              style: GoogleFonts.inter(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
                fontSize: 20
                ),
              ),
              SizedBox(height: 20),

              // Username box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                ///child: Container(
                ///  decoration: BoxDecoration(
                ///    border: Border.all(color: Colors.grey),
                ///    borderRadius: BorderRadius.circular(10)
                ///  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(76, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 52, 63, 70)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: '  Enter your email ',
                        contentPadding: EdgeInsets.symmetric(horizontal:(20.0),vertical:(15.0),
                        
                      ),
                    ),
                  )
                )
              ),

              //Password box
            
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                ///child: Container(
                ///  decoration: BoxDecoration(
                ///    border: Border.all(color: Colors.grey),
                ///    borderRadius: BorderRadius.circular(10)
                ///  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 152, 3, 251),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 52, 63, 70)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: '  Password ',
                        contentPadding: EdgeInsets.symmetric(horizontal:(20.0),vertical:(15.0),
                      ),
                    ),
                  )
                )
              ),

              SizedBox(height: 5),

              Container(
                width: 332,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 151, 73, 158),
                      Color.fromARGB(255, 82, 27, 163),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
                    minimumSize: WidgetStateProperty.all<Size>(Size(332, 60)),
                    // Ensure padding, elevation, etc., are set as needed
                  ),
                  child: Text(
                    'SIGN IN',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Color.fromARGB(255, 82, 27, 163),
                      ),
                    ),
                  ),
                ],
              )
            ] //children
          ),
        ),
      ),
    );
  }
}