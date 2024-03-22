import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta/components/Header/Header.dart';
import 'package:insta/screens/stories.dart';

class NewPosts extends StatefulWidget {
  final CameraDescription? camera;

  const NewPosts({Key? key, this.camera}) : super(key: key);
  @override
  _NewPostsState createState() => _NewPostsState();
}

class _NewPostsState extends State<NewPosts>
    with SingleTickerProviderStateMixin {
  bool isContainPic = false;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void handleChangePicSize() {
    setState(() {
      isContainPic = !isContainPic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewPostsHeaderState(),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/post.jpeg'),
                    fit: isContainPic ? BoxFit.contain : BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: handleChangePicSize,
                    icon: const Icon(
                      Icons.crop,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Text("Recent",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: <Widget>[
                          OutlinedButton.icon(
                            onPressed: null,
                            icon: const Icon(
                              Icons.copy_all,
                              color: Colors.white,
                              size: 20,
                            ),
                            label: const Text(
                              "SELECT MULTIPLE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.shade800),
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: null,
                            icon: const Icon(Icons.camera_alt_outlined,
                                color: Colors.white),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.shade800),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 0.5,
                    mainAxisSpacing: 0.5,
                    childAspectRatio: 1,
                    children: [
                      Image.asset('assets/post.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                      Image.asset('assets/post.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                      Image.asset('assets/post.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                      Image.asset('assets/post.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                      Image.asset('assets/post.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                      Image.asset('assets/post.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 50, // Specify the desired height of the TabBar
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black,
                        // Color.fromARGB(108, 71, 71, 71),
                      ],
                    ),
                  ),
                ),
                title: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white38,
                  labelPadding: EdgeInsets.all(10),
                  labelStyle: const TextStyle(letterSpacing: 2),
                  onTap: (value) {
                    print("value");
                    print(value);
                    if (value == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Stories(
                              camera: widget.camera,
                            );
                          },
                        ),
                      );
                    }
                  },
                  tabs: const <Widget>[
                    Tab(text: 'POST'),
                    Tab(text: 'STORY'),
                    Tab(text: 'REEL'),
                    Tab(text: 'LIVE'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
