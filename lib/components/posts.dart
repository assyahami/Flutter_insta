// ignore_for_file: unused_element, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:insta/components/card.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool isLike = false;
  bool isBookmark = false;
  final List<String> images = [
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Expanded(
            child: ListView(
          padding: const EdgeInsets.all(0),
          children: const [
            PostCards(),
          ],
        )),
      ]),
    );
  }
}
