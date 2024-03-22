import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta/screens/chatboard.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  _MessageState createState() => _MessageState();
}

final List<String> images = [
  'assets/post.jpeg',
  'assets/post.jpeg',
  'assets/post.jpeg',
  'assets/post.jpeg',
  'assets/post.jpeg',
  'assets/post.jpeg',
];

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          autocorrect: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.white30),
            filled: true,
            fillColor: Colors.white10,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: images
                  .asMap()
                  .map((index, e) => MapEntry(
                      index,
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(children: [
                            Badge(
                              alignment: AlignmentDirectional.topStart,
                              largeSize: 25,
                              backgroundColor: Colors.black,
                              label: Text(
                                "${index == 0 ? "Note.." : "meessage"}",
                                style: TextStyle(
                                  color: index == 0
                                      ? Colors.white38
                                      : Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(e),
                                radius: 40.0,
                                // label: Icon(Icons.abc_outlined),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                index == 0 ? "Your note" : "Username ${index}",
                                style: const TextStyle(
                                  color: Colors.white38,
                                ),
                              ),
                            )
                          ]))))
                  .values
                  .toList(),
            )),
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Messages",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            TextButton(
                onPressed: null,
                child: Text(
                  "Request",
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 15,
                  ),
                ))
          ],
        ),
      ),
      Expanded(
          // padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: images
                    .asMap()
                    .map((index, e) => MapEntry(
                        index,
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Chatboard()),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: index == 0 ? 0 : 20,
                                  left: 10,
                                  right: 10),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/post.jpeg"),
                                        radius: 30.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Raashid_shakib",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Sent a reel by _cool_lip..",
                                                    style: TextStyle(
                                                      color: Colors.white38,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "7h",
                                                    style: TextStyle(
                                                      color: Colors.white30,
                                                    ),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ))))
                    .values
                    .toList(),
              ))),
    ]);
  }
}
