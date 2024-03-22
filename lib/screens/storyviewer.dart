import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "dart:math" as math;

class StoryViewer extends StatefulWidget {
  const StoryViewer({
    Key? key,
    this.posterImage,
    this.posterPic = '',
  }) : super(key: key);

  final List<File>? posterImage;
  final String posterPic;

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: false,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(widget.posterImage!.last),
                      fit: BoxFit.cover),
                ),
              )),
          LinearProgressIndicator(
            value: controller.value,
            semanticsValue: 'Linear progress',
          ),
          const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/post.jpg"),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "assy_07",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "27 m",
                        style: TextStyle(
                          color: Colors.white30,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: null,
                    color: Colors.white,
                  )
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black, // Add opacity to the background
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            hintText: 'Send message',
                            hintStyle: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10)),
                      ),
                    ),
                    const IconButton(
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: null,
                    ),
                    Transform.rotate(
                      angle: 100,
                      child: const IconButton(
                        icon: Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
      backgroundColor: Colors.black,
    );
  }
}
