import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoScreen extends StatelessWidget {
  final String keyYt;
  const VideoScreen({super.key, required this.keyYt});

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      autoFullScreen: true,
      backgroundColor: Colors.white,
      controller: YoutubePlayerController.fromVideoId(
        videoId: keyYt,
        autoPlay: false,
        params: const YoutubePlayerParams(showFullscreenButton: true),
      ),
      aspectRatio: 16 / 9,
      builder: (context, player) {
        return Column(
          children: [
            player,
            const Text('Youtube Player'),
          ],
        );
      },
    );
  }
}
