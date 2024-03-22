import 'package:flutter/material.dart';
import 'package:insta/screens/login.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _password = TextEditingController();
  bool isButton = false;
  bool isShowPassword = false;

  @override
  void initState() {
    super.initState();
    _password.addListener(_updateButtons);
  }

  @override
  void dispose() {
    super.dispose();
    _password.dispose();
  }

  void _updateButtons() {
    setState(() {
      isButton = _password.text.isNotEmpty;
    });
  }

  void _showPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back to Username',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.black,
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Center(
                  child: Column(
                children: [
                  Text('Create a password',
                      style: TextStyle(color: Colors.white, fontSize: 35)),
                ],
              )),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'For security your password must be at least character or more.',
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Color(0x9BFFFFFF)),
                      labelStyle: TextStyle(color: Color(0x9BFFFFFF)),
                      // labelStyle: TextStyle(color: Colors.white10)),x
                      fillColor: Color.fromARGB(72, 158, 158, 158),
                      filled: true,
                      suffixIcon: Icon(
                        Icons.visibility_off_rounded,
                        color: Color(0x9BFFFFFF),
                      )),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    width: 500,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => Login()),
                        // );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            isButton
                                ? const Color.fromARGB(255, 92, 168, 255)
                                : const Color(0x622E84E6)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: isButton
                                ? const Color(0xFFFFFDFD)
                                : const Color(0xDD6F6F6F)),
                      ),
                    ),
                  )),
            ],
          )),
      backgroundColor: Colors.black,
    );
  }
}
