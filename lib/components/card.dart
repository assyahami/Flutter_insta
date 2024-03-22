// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/screens/storyPreview.dart';
import 'package:insta/screens/storyviewer.dart';

class PostCards extends StatefulWidget {
  const PostCards({super.key});
  @override
  _PostCardsState createState() => _PostCardsState();
}

class _PostCardsState extends State<PostCards> {
  final List<String> images = [
    'assets/post.jpeg',
    'assets/post.jpeg',
    'assets/post.jpeg',
    'assets/post.jpeg',
    'assets/post.jpeg',
    'assets/post.jpeg',
  ];

  bool isLike = false;
  bool isBookmark = false;
  List<File> caputureImages = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: images
                        .asMap()
                        .map((index, e) => MapEntry(
                              index,
                              index == 0
                                  ? Badge(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      largeSize: 20,
                                      backgroundColor: Colors.blue.shade400,
                                      label: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(e),
                                        radius: 40.0,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             StoryViewer(
                                        //               posterImage: [e],
                                        //             )));
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(38),
                                              border: Border.all(
                                                color: const Color.fromARGB(
                                                    27,
                                                    255,
                                                    255,
                                                    255), // Use a solid white color for the border
                                                width: 2,
                                              ),
                                              color: Colors.grey.shade200,
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xFF9B2282),
                                                  Color(0xFFEEA863),
                                                  Color(0xFFF6CA3E),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: ClipRRect(
                                                child: Container(
                                                  child: CircleAvatar(
                                                    backgroundImage:
                                                        AssetImage(e),
                                                    radius: 40.0,
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          )

                                          // CircleAvatar(
                                          //   backgroundImage: AssetImage(e),
                                          //   radius: 30.0,
                                          // )
                                          )),
                            ))
                        .values
                        .toList(),
                  )),
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 20.0,
                              backgroundImage:
                                  AssetImage("assets/story1_prev_ui.png")),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "assy_10",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Text(
                                    "T.nagar,Chennai",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ))
                    ])),
            Image.asset("assets/post.jpeg", fit: BoxFit.cover),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isLike = !isLike;
                        });
                      },
                      icon: Icon(
                        isLike
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isLike ? Colors.red.shade400 : Colors.white,
                      )),
                  const IconButton(
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.comment,
                        color: Colors.white,
                      )),
                  Transform.rotate(
                    angle: 100,
                    child: const IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isBookmark = !isBookmark;
                    });
                  },
                  icon: Icon(
                    isBookmark ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.white,
                  )),
            ]),
            const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "6 likes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "View all comments",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "3 minutes ago",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ]),
          ]),
    );
  }
}
