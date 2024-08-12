import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AutoPlayVideoPlayer extends StatefulWidget {
  final String videoUrl;

  AutoPlayVideoPlayer({required this.videoUrl});

  @override
  _AutoPlayVideoPlayerState createState() => _AutoPlayVideoPlayerState();
}

class _AutoPlayVideoPlayerState extends State<AutoPlayVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with the video URL
    _controller = VideoPlayerController.network(widget.videoUrl);

    // Initialize the video player and start playing
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {
        _controller.play(); // Start playing automatically
        _controller.setLooping(true); // Optionally, loop the video
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
