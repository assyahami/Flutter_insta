// ignore_for_file: library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/components/Header/Header.dart';
import 'package:insta/components/card.dart';
import 'package:insta/components/posts.dart';
import 'package:insta/screens/addposts.dart';
import 'package:insta/screens/messages.dart';
import 'package:insta/screens/profile.dart';
import 'package:insta/screens/reels.dart';
import 'package:insta/screens/search.dart';
import 'package:insta/screens/searchContainer.dart';
import "dart:developer" as devLog;

import 'package:insta/screens/stories.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.camera});
  final CameraDescription camera;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchTextController = TextEditingController();
  final List<String> images = [
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
    'assets/story1_prev_ui.png',
  ];
  final List<String> posts = [
    'assets/post.png',
    'assets/logo.png',
    'assets/story1_prev_ui.png',
    'assets/logo.jpg',
  ];
  int _selectedIndex = 0;
  bool isLike = false;
  bool isBookmark = false;
  bool isSearch = false;
  final PageController _controller = PageController(initialPage: 1);
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 1;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewPosts()),
        );
      } else {
        _selectedIndex = index;
      }
    });
  }

  void _searchFieldTap() {
    setState(() {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      isSearch = !isSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header;
    Widget body;
    switch (_selectedIndex) {
      case 0:
        header = HomeHeaderState();
        body = const SingleChildScrollView(
          child: PostCards(),
        );
        break;
      case 1:
        header = SearchHeader(
            controller: _searchTextController,
            onTap: _searchFieldTap,
            isSearched: isSearch);
        body = isSearch ? SearchContainer() : Search();
        break;
      case 3:
        header = ReelsHeaderState();
        body = const Reels();
        break;
      case 4:
        header = ProfileHeaderState();
        body = const Profile();
        break;
      default:
        header = HomeHeaderState();
        body = const SingleChildScrollView(
          child: PostCards(),
        );
    }
    if (_currentPage == 2) {
      header = const MessageHeaderState(
        fromScreen: "homepage",
      );
    }
    return Scaffold(
      appBar: _selectedIndex == 3 || _currentPage == 0
          ? null
          : header as PreferredSizeWidget,
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: [
          Stories(
            camera: widget.camera,
          ),
          body,
          const Message()
        ],
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: _currentPage == 0
          ? null
          : BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType
                  .fixed, // Set the background color here
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    _selectedIndex == 3
                        ? "assets/icons/reelflled.png"
                        : "assets/icons/reel.png",
                    width: 25,
                  ),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person_2),
                  label: '',
                ),
              ],
            ),
    );
  }
}
