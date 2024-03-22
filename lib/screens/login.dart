// ignore_for_file: library_private_types_in_public_api

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta/screens/Signup.dart';
import 'package:insta/screens/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool isBtnDisabled = false;

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _username.addListener(_enabledButton);
    _password.addListener(_enabledButton);
  }

  void _enabledButton() {
    setState(() {
      if (_username.text.isNotEmpty && _password.text.isNotEmpty) {
        isBtnDisabled = true;
      } else {
        isBtnDisabled = false;
      }
    });
  }

  void _onPressed() {
    // Your logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/logo.jpg',
                width: 250,
                height: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number, email, or username',
                  fillColor: Color.fromARGB(72, 158, 158, 158),
                  hintStyle: TextStyle(color: Color(0x9BFFFFFF)),
                  labelStyle: TextStyle(color: Color(0x9BFFFFFF)),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _password,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Color(0x9BFFFFFF)),
                  labelStyle: TextStyle(color: Color(0x9BFFFFFF)),
                  fillColor: Color.fromARGB(72, 158, 158, 158),
                  filled: true,
                  suffixIcon: Icon(Icons.visibility_off_rounded),
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: 500,
                child: ElevatedButton(
                  onPressed: !isBtnDisabled
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home(
                                      camera: widget.camera,
                                    )),
                          );
                        },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        isBtnDisabled
                            ? const Color.fromARGB(255, 92, 168, 255)
                            : const Color(0x622E84E6)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: isBtnDisabled
                            ? const Color(0xFFFFFDFD)
                            : const Color(0xDD6F6F6F)),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text('Forgot your login details? ',
                      style: TextStyle(color: Colors.grey)),
                  Text('Get help logging in.',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('OR',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _onPressed();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(210, 12, 126, 255)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.facebook),
                  label: const Text('Continue with Facebook'),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signup()),
                );
              },
              child:
                  const Text('Sign up', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
