import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:chewie/chewie.dart';
import 'package:insta/components/Header/Header.dart';
import 'package:insta/components/Reels/content_load.dart';
import 'package:video_player/video_player.dart';

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  _ReelsState createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  final List<String> videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];
  ChewieController? _videoController;
  late VideoPlayerController _videoPlayerController;
  bool _isLike = false;
  @override
  void initState() {
    super.initState();
  }

  Future initializePlayer() async {}

  @override
  void dispose() {
    _videoController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Swiper(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _isLike = !_isLike;
                  });
                },
                child: ReelsContentScreen(
                  src: "https://wallpapercave.com/uwp/uwp4234858.jpeg",
                  isLike: _isLike,
                ),
              );
            },
            scrollDirection: Axis.vertical,
          ),
          ReelsHeaderState(),
        ],
      ),
    );
  }
}
