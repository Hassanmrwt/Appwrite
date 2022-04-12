import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite1/views/home.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String name = '', email = '', pass = '';
  Client client = Client();
  bool isLoading = false;

  Future createAcc() async {
    client
        .setEndpoint('http://192.168.43.2/v1')
        .setProject('6255398d67915c15bbe9');
    Account account = Account(client);
    setState(() {
      isLoading = true;
    });
    var userId = randomAlphaNumeric(10);
    Future user = account
        .create(userId: userId, email: email, password: pass, name: name)
        .whenComplete(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
      setState(() {
        isLoading = false;
      });
    });
    user.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Flutter',
                style: TextStyle(fontSize: 22, color: Colors.green),
              ),
              Text(
                'Blog',
                style: TextStyle(fontSize: 22, color: Colors.blue),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Name', suffixIcon: Icon(Icons.man)),
                        onChanged: (val) {
                          name = val;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Email', suffixIcon: Icon(Icons.email)),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: Icon(Icons.password),
                        ),
                        onChanged: (val) {
                          pass = val;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green),
                        child: TextButton(
                            onPressed: () {
                              createAcc();
                            },
                            child: Text('Sign Up',
                                style: TextStyle(color: Colors.white))),
                      )
                    ],
                  ),
                ),
              ));
  }
}
