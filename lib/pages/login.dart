import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/pages/signup.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
            const Text('Welcome back!'),
            const SizedBox(height: 5),
            const Text('This is a simple login page.'),
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
                                      color:
                                          Color.fromARGB(255, 122, 125, 128)),
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
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
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
                child: const Text('SIGN IN'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: const Text('Sign up'),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
