import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_swipe/models/card_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key, required this.card});
  final CardModel card;
  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _controller.loadVideoById(videoId: "Fo7XPf9j9lo");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
          border: Border.all(
            color: const Color.fromARGB(255, 210, 210, 210), // Border color
            width: 1.0, // Border width
          ),
        ),
        child: YoutubePlayerScaffold(
          controller: _controller,
          builder: (context, player) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return player;
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
