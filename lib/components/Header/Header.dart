// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta/screens/home.dart';
import 'package:insta/screens/search.dart';

// class HomeHeader extends StatefulWidget {
//   const HomeHeader({super.key});
//   @override
//   _HomeHeaderState createState() => _HomeHeaderState();
// }

class HomeHeaderState extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/logo.jpg',
        fit: BoxFit.cover,
        width: 150,
      ),
      backgroundColor: Colors.black,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.favorite_border_outlined, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.facebookMessenger,
              color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}

class SearchHeader extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController? controller;
  final VoidCallback onTap;
  final bool isSearched;
  const SearchHeader(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.isSearched})
      : super(key: key);

  @override
  _SearchHeaderState createState() => _SearchHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchHeaderState extends State<SearchHeader> {
  late TextEditingController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = widget.controller  TextEditingController();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AppBar(
        leading: !widget.isSearched
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                onPressed: widget.onTap,
              ),
        leadingWidth: 30,
        automaticallyImplyLeading: false,
        title: Container(
          child: TextField(
            onTap: widget.onTap,
            style: const TextStyle(color: Colors.white),
            autocorrect: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.white30),
              filled: true,
              fillColor: Colors.white10,
            ),
          ),
        ),
        backgroundColor: Colors.black26,
      ),
    );
  }
}

class NewPostsHeaderState extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close, color: Colors.white, size: 24),
        onPressed: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const Home()));
        },
      ),
      automaticallyImplyLeading: false,
      title: const Text(
        "New post",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: null,
            child: Text(
              "Next",
              style: TextStyle(
                color: Colors.blue.shade800,
                fontSize: 20,
              ),
            ))
      ],
      backgroundColor: Colors.transparent,
    );
  }
}

class ReelsHeaderState extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  )),
              Text(
                "Reels",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 20,
                )),
          )
        ],
      ),
    );
  }
}

class MessageHeaderState extends StatelessWidget
    implements PreferredSizeWidget {
  final String fromScreen;
  const MessageHeaderState({
    required this.fromScreen,
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const Home()));
        },
      ),
      automaticallyImplyLeading: false,
      title: const Text(
        "assy__07",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: null,
            icon: Icon(
                fromScreen == "chatboard"
                    ? Icons.call
                    : Icons.video_call_outlined,
                color: Colors.white)),
        IconButton(
            onPressed: null,
            icon: FaIcon(
                fromScreen == "chatboard"
                    ? FontAwesomeIcons.video
                    : FontAwesomeIcons.edit,
                color: Colors.white)),
      ],
      backgroundColor: Colors.black,
    );
  }
}

class ProfileHeaderState extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        children: <Widget>[
          Text(
            "assy__07",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Icon(Icons.arrow_drop_down, color: Colors.white)
        ],
      ),
      actions: const <Widget>[
        IconButton(
            onPressed: null,
            icon: Icon(Icons.add_box_outlined, color: Colors.white)),
        IconButton(
            onPressed: null,
            icon: FaIcon(FontAwesomeIcons.bars, color: Colors.white)),
      ],
      backgroundColor: Colors.black,
    );
  }
}

class StoryHeaderState extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.close,
              color: Colors.white,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.flash_off_outlined,
              color: Colors.white,
            )),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.settings, color: Colors.white),
        ),
      ],
    );
  }
}
