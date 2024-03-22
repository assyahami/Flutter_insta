import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/screens/storyviewer.dart';
import 'package:insta/widgets/storydesignDrawer.dart';
import 'dart:math' as math;

class StoryPreview extends StatefulWidget {
  final List<File> storyPic;
  const StoryPreview({required this.storyPic});

  @override
  _StoryPreviewState createState() => _StoryPreviewState();
}

final scaffoldState = GlobalKey<ScaffoldState>();

class _StoryPreviewState extends State<StoryPreview> {
  bool isDrawerOpen = false;
  PersistentBottomSheetController? _storyDesignOptions;
  void _showSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return StoryDesignOptions();
        }).then((value) {
      setState(() {
        isDrawerOpen = !isDrawerOpen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldState,
      extendBodyBehindAppBar: true,
      appBar: null,
      body: SafeArea(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(widget.storyPic.last),
                            fit: BoxFit.cover),
                      ),
                    ))),
            Positioned(
              top: 0,
              width: deviceWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!isDrawerOpen)
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: IconButton.filled(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black26),
                          ),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          )),
                    ),
                  if (!isDrawerOpen)
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors
                                  .black26, // Change the color to your desired background color
                            ),
                            child: const TextButton(
                              onPressed: null,
                              child: Text(
                                "Aa",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isDrawerOpen = true;
                              });

                              _showSheet();
                              // showStoryDesignOptions(context);
                            },
                            child: IconButton.filled(
                              onPressed: null,
                              icon: const FaIcon(
                                FontAwesomeIcons.smile,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black26),
                              ),
                            )),
                        IconButton.filled(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black26),
                            ),
                            icon: const Icon(
                              Icons.filter_b_and_w_outlined,
                              color: Colors.white,
                            )),
                        IconButton.filled(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black26),
                            ),
                            icon: const Icon(
                              Icons.music_note_outlined,
                              color: Colors.white,
                            )),
                        IconButton.filled(
                            color: Colors.black,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black26),
                            ),
                            onPressed: null,
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      )),
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.white10)),
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/post.jpeg",
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Your stoires",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.white10)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoryViewer(
                                  posterImage: widget.storyPic,
                                )));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.stars,
                        color: Colors.green,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Close friends",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  )),
              IconButton.filled(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
