// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/components/Header/Header.dart';
import 'package:insta/widgets/like.dart';

class ReelsContentScreen extends StatelessWidget {
  final String src;
  final bool isLike;
  const ReelsContentScreen(
      {super.key, required this.src, required this.isLike});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: 320.0,
          height: 1000,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(src),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                  BlendMode.darken),
            ),
          ),
          child: isLike ? Likes() : null,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: const Color.fromARGB(27, 255, 255,
                                    255), // Use a solid white color for the border
                                width: 2.5,
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
                                borderRadius: BorderRadius.circular(20),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/post.jpeg"),
                                  radius: 20.0,
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "assy_07",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          OutlinedButton(
                              onPressed: null,
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "From adirai assy...",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/post.jpeg"),
                            radius: 8,
                          ),
                          SizedBox(
                            height: 10,
                            width: 5,
                          ),
                          Text(
                            "Liked by i_love and 7,000 others...",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0x79000000),
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.music,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Curved Container ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.dotCircle,
                                  color: Colors.white,
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Original audio',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0x79000000),
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '13 people',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            isLike
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: isLike ? Colors.red.shade400 : Colors.white,
                            size: 30,
                          ),
                          Text(
                            "2.2M",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: <Widget>[
                          Transform.flip(
                            flipX: true,
                            child: FaIcon(
                              FontAwesomeIcons.comment,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Text(
                            "15.2K",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: <Widget>[
                          Transform.rotate(
                            angle: 100,
                            child: Icon(
                              Icons.send_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "456K",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          // Adjust the radius as needed
                        ),
                        child: Image.asset(
                          "assets/post.jpeg",
                          fit: BoxFit.cover,
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
