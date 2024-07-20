import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 238, 219, 255),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 20),
            const Text('Sign Up today!'),
            const SizedBox(height: 5),
            const Text('This is a simple Signup page.'),
            const SizedBox(height: 20),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Username box
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(76, 255, 255, 255),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 52, 63, 70)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: '  Enter your email ',
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: (20.0),
                                  vertical: (15.0),
                                ),
                              ),
                            ))),

                    //Password box
                    const SizedBox(height: 5),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(255, 152, 3, 251),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 52, 63, 70)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: '  Password ',
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: (20.0),
                                  vertical: (15.0),
                                ),
                              ),
                            ))),
                  ],
                )),
            const SizedBox(height: 5),
            Container(
              width: 332,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 151, 73, 158),
                    Color.fromARGB(255, 82, 27, 163),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } on FirebaseAuthException catch (e) {
                    print(e);
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  minimumSize:
                      WidgetStateProperty.all<Size>(const Size(332, 60)),
                  // Ensure padding, elevation, etc., are set as needed
                ),
                child: const Text('SIGN UP'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have an account?'),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text('Sign In'),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
