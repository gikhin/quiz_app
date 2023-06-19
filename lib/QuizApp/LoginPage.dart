import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled22/QuizApp/Bottom.dart';
import 'package:untitled22/QuizApp/Homepage.dart';
import 'package:untitled22/QuizApp/Pages.dart';

import 'Questions.dart';
import 'SignupPage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );Fluttertoast.showToast(msg: 'User Successfully Loggedin');
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Error'),
          content: const Text('Failed to login. Please check your Email or Password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 55.0,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            "LOG IN PAGE",
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 15.0,
                              right: 15.0,
                              left: 15.0,
                              top: 12.0,
                            ),
                            child: TextFormField(
                              controller: email,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please Enter Your Email";
                                } else if (!val.contains('@')) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                //fillColor: Colors.white,
                                hintText: 'Enter Your Email',
                                labelText: 'Email',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 15.0,
                              right: 15.0,
                              left: 15.0,
                              top: 12.0,
                            ),
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Password Cannot be Empty";
                                } else if (val.length < 8) {
                                  return "Password must be 8 letters long";
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                //fillColor: Colors.white,
                                hintText: 'Enter Your Password',
                                labelText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Container(
                              height: 45,
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple,
                                  ),
                                  onPressed: () {
                                    _login();
                                    if (formKey.currentState!.validate()) {
                                      debugPrint("All Validation Passed");
                                      Fluttertoast.showToast(msg: 'User Successfully Logged In');

                                    }
                                  },
                                  child: Text('Login'),
                                ),
                              ),
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Signup()),
                              );
                            },
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
