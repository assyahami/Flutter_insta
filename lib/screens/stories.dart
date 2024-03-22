import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta/components/Header/Header.dart';
import 'package:camera/camera.dart';
import 'package:insta/screens/messages.dart';
import 'package:insta/screens/storyPreview.dart';
import 'package:path/path.dart';

class Stories extends StatefulWidget {
  final CameraDescription? camera;
  const Stories({super.key, this.camera});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> with TickerProviderStateMixin {
  late CameraController _controller;
  CameraDescription? _selectedCamera;
  late Future<void> _initializeControllerFuture;
  late Future<void> _initializeControllerFilter;
  late final TabController __tabcontroller;
  List<File> caputureImages = [];
  bool storyOptions = false;
  int _switchCamera = 1;
  int _filtercontroller = 0;
  final List<String> images = [
    "assets/story_filter/home.jpg",
    "assets/story_filter/glitch.jpg",
    "assets/story_filter/sweet.jpg",
    "assets/story_filter/trippy.jpg",
    "assets/story_filter/vintage_retro.jpg",
  ];

  final List<String> filters = [
    "home",
    "glitch",
    "sweet",
    "trippy",
    "vintage_retro",
  ];
  @override
  void initState() {
    super.initState();
    _initializeCamera(_switchCamera);
    __tabcontroller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  void _initializeCamera(int cameraOptions) async {
    List<CameraDescription> cameras = await availableCameras();
    _controller =
        CameraController(cameras[cameraOptions], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
  }

  void _toggleCamera() {
    setState(() {
      _initializeCamera(_switchCamera);
      _switchCamera = _switchCamera == 0 ? 0 : 1;
    });
  }

  void _showStoryOptions() {
    setState(() {
      storyOptions = !storyOptions;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showBottomDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Column(
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9, // Number of avatars
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle avatar tap
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green,
                          // You can use an image here for the avatar
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    if (_controller == null || !_controller.value.isInitialized) {
      return Container(); // Return an empty container while the camera is initializing
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: null,
      body: SafeArea(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CameraPreview(_controller);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                      top: 0, width: deviceWidth, child: StoryHeaderState()),
                  Positioned(
                    top: (deviceHeight / 2) - 50,
                    left: 10,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.text_format,
                                    color: Colors.white,
                                    size: 28,
                                  )),
                              if (storyOptions)
                                const Text(
                                  "Create",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              const IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.all_inclusive,
                                    color: Colors.white,
                                    size: 28,
                                  )),
                              if (storyOptions)
                                const Text(
                                  "Boomerang",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              const IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.grid_view_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  )),
                              if (storyOptions)
                                const Text(
                                  "layout",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                            ],
                          ),
                          AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: storyOptions ? 50 : 0,
                              curve: Curves.easeInOut,
                              child: Row(
                                children: [
                                  if (storyOptions)
                                    const IconButton(
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.white,
                                          size: 28,
                                        )),
                                  if (storyOptions)
                                    const Text(
                                      "Hands free ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                ],
                              )),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: _showStoryOptions,
                                  icon: Icon(
                                    storyOptions
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 28,
                                  )),
                              if (storyOptions)
                                Text(
                                  storyOptions ? "Open" : "Close",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                              height: 75,
                              viewportFraction: 0.25,
                              enableInfiniteScroll: false,
                              onPageChanged: (int index, reason) {
                                setState(() {
                                  _filtercontroller = index;
                                });
                              }),
                          itemCount: images.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              GestureDetector(
                                  onTap: () async {
                                    await _initializeControllerFuture;
                                    var filex = await _controller.takePicture();
                                    setState(() {
                                      caputureImages.add(File(filex.path));
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StoryPreview(
                                                storyPic: caputureImages)));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(75),
                                        color: Colors.white,
                                        border: itemIndex == _filtercontroller
                                            ? Border.all(
                                                width: 5, color: Colors.white)
                                            : Border.all(
                                                width: 0,
                                                color: Colors.transparent)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(75),
                                      child: Image.asset(
                                        itemIndex == _filtercontroller &&
                                                itemIndex == 0
                                            ? "assets/story_filter/empty_img.jpg"
                                            : images[itemIndex],
                                        fit: BoxFit.cover,
                                        width: 70,
                                        // height: 75,
                                      ),
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
      bottomNavigationBar: SafeArea(
          child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  "assets/post.jpeg",
                  fit: BoxFit.cover,
                  width: 25,
                  height: 25,
                ),
              ),
              onTap: () {
                _showBottomDrawer(context);
              },
            ),
            SizedBox(
              width: _filtercontroller == 0 ? 0 : 20,
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 50,
                child: _filtercontroller != 0
                    ? ListView.builder(
                        itemCount: filters.length,
                        itemBuilder: (context, index) {
                          String filter = filters[_filtercontroller];
                          return ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(vertical: 0)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white12)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Colors.white30,
                                      )),
                                  Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(filter,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14)),
                                          Text("by $filter",
                                              style: const TextStyle(
                                                  color: Colors.white38)),
                                        ],
                                      )),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Colors.white30,
                                      ))
                                ],
                              ));
                        })
                    : TabBar(
                        isScrollable: true,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white38,
                        labelPadding: EdgeInsets.all(10),
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: Colors
                              .transparent, // Set your desired active color here
                          borderRadius: BorderRadius.circular(
                              10), // Optional: Add border radius to the active tab indicator
                        ),
                        labelStyle: const TextStyle(letterSpacing: 2),
                        controller: __tabcontroller,
                        tabs: const <Widget>[
                          Tab(text: 'POST'),
                          Tab(text: 'STORY'),
                          Tab(text: 'REEL'),
                          Tab(text: 'LIVE'),
                        ],
                      ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                  onPressed: _toggleCamera,
                  icon: const Icon(
                    Icons.screen_rotation,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      )),
      backgroundColor: Colors.transparent,
    );
  }
}

// ElevatedButton(
//                         onPressed: null,
//                         style: ButtonStyle(
//                             padding: MaterialStateProperty.all(
//                                 const EdgeInsets.symmetric(vertical: 0)),
//                             backgroundColor:
//                                 const MaterialStatePropertyAll(Colors.white12)),
//                         child: const Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             IconButton(
//                                 onPressed: null,
//                                 icon: Icon(
//                                   Icons.bookmark_border_outlined,
//                                   color: Colors.white30,
//                                 )),
//                             Padding(
//                                 padding: EdgeInsets.all(0),
//                                 child: Column(
//                                   children: [
//                                     Text("Glitch",
//                                         style: TextStyle(
//                                             color: Colors.white, fontSize: 14)),
//                                     Text("by Glitch",
//                                         style:
//                                             TextStyle(color: Colors.white38)),
//                                   ],
//                                 )),
//                             IconButton(
//                                 onPressed: null,
//                                 icon: Icon(
//                                   Icons.close_rounded,
//                                   color: Colors.white30,
//                                 ))
//                           ],
//                         ))