import 'package:flutter/material.dart';
import 'package:insta/screens/password.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _username = TextEditingController();
  bool isButton = false;

  @override
  void initState() {
    super.initState();
    _username.addListener(_updateButtons);
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
  }

  void _updateButtons() {
    setState(() {
      isButton = _username.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Center(
                  child: Column(
                children: [
                  Text('Choose username',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  Text('You can always change it later',
                      style: TextStyle(color: Colors.grey)),
                ],
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _username,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Color(0x9BFFFFFF)),
                      labelStyle: TextStyle(color: Color(0x9BFFFFFF)),
                      // labelStyle: TextStyle(color: Colors.white10)),x
                      fillColor: Color.fromARGB(72, 158, 158, 158),
                      filled: true,
                      suffixIcon: Icon(
                        Icons.person,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Password()),
                        );
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
