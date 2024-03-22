import 'package:flutter/material.dart';
import 'package:insta/components/Header/Header.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  List<Map<String, dynamic>> categories = [
    {"name": "Sports", "icon": Icons.trending_up_sharp},
    {"name": "Entertainment", "icon": Icons.trending_up_sharp},
    {"name": "Motivational", "icon": Icons.trending_up_sharp},
    {"name": "Shows", "icon": Icons.trending_up_sharp},
  ];

  List<Map<String, dynamic>> searchHistory = [
    {
      "username": "assy__o7",
      "name": "Ashiq ahamed",
      "icon": Icons.trending_up_sharp
    },
    {"username": "assy__o7", "name": "Manas", "icon": Icons.trending_up_sharp},
    {
      "username": "assy__o7",
      "name": "Raashid",
      "icon": Icons.trending_up_sharp
    },
    {
      "username": "assy__o7",
      "name": "Kingsly",
      "icon": Icons.trending_up_sharp
    },
    {"username": "assy__o7", "name": "Muthu", "icon": Icons.trending_up_sharp},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: NewPostsHeaderState(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                direction: Axis.horizontal,
                children: categories.map((category) {
                  return ElevatedButton.icon(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(171, 66, 66, 66),
                      ),
                    ),
                    icon: Icon(
                      category["icon"] ?? Icons.trending_up,
                      color: Colors.white,
                    ),
                    label: Text(
                      category["name"] ?? "Sports",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recent",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              TextButton(
                                onPressed: null,
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    color: Color(0xFF2196F3),
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            direction: Axis.vertical,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/post.jpeg"),
                                    radius: 30,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Ashiq ahamed",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              )),
                                          Text("assy_07",
                                              style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 14,
                                              )),
                                        ],
                                      )),
                                  SizedBox(
                                    width: 120,
                                    height: 10,
                                  ),
                                  IconButton.outlined(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0x84FFFFFF),
                                      ))
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            direction: Axis.vertical,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/post.jpeg"),
                                    radius: 30,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Ashiq ahamed",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              )),
                                          Text("assy_07",
                                              style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 14,
                                              )),
                                        ],
                                      )),
                                  SizedBox(
                                    width: 120,
                                    height: 10,
                                  ),
                                  IconButton.outlined(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0x84FFFFFF),
                                      ))
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            direction: Axis.vertical,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/post.jpeg"),
                                    radius: 30,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Ashiq ahamed",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              )),
                                          Text("assy_07",
                                              style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 14,
                                              )),
                                        ],
                                      )),
                                  SizedBox(
                                    width: 120,
                                    height: 10,
                                  ),
                                  IconButton.outlined(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0x84FFFFFF),
                                      ))
                                ],
                              )
                            ],
                          )),
                    ],
                  ))),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
