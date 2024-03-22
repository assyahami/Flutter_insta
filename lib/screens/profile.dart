import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/post.jpeg"),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text("Ashiq Ahamed",
                      style: TextStyle(fontSize: 15, color: Colors.white))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "9",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "posts",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        "262",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "followers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        "672",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "following",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "The man born to make history of the world",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: null,
                child: Text(
                  "Edit profile",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white30),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text(
                  "Share profile",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white30),
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.person_2_outlined,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white30),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/post.jpeg"),
                      radius: 40,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white30, // specify your border color here
                        width: 2, // specify the width of the border
                      ),
                    ),
                    child: const CircleAvatar(
                      child: const Icon(Icons.add, color: Colors.white),
                      backgroundColor: Colors.transparent,
                      radius: 40,
                    ),
                  ),
                ],
              )),
          SingleChildScrollView(
              child: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white38,
            tabs: const <Widget>[
              Padding(
                padding: EdgeInsets.all(0),
                child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.grid_on_outlined,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.video_call_sharp,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.person_pin_outlined,
                      color: Colors.white,
                    )),
              ),
            ],
          )),
          Container(
            // Adjust this value as needed
            child: Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
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
                        ],
                      ),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
