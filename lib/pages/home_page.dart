import "package:firebase_auth/firebase_auth.dart";
//import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  void userSignOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: userSignOut, icon: Icon(Icons.logout))
        ]),
      body: const Center(child: Text('Logged In'),),
    );
  }
}