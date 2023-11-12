import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social/common/helpdesk/utils.dart';
import 'package:video_player/video_player.dart';
class UpLoadVideoScreen extends StatefulWidget {
  const UpLoadVideoScreen({super.key});

  @override
  State<UpLoadVideoScreen> createState() => _UpLoadVideoScreenState();
}

class _UpLoadVideoScreenState extends State<UpLoadVideoScreen> {
  String? videoURL;
  VideoPlayerController? _controller;
  @override
  void dispose(){
    _controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: videoURL != null
                ? videoPreviewWidget()
                : const Text('No video selected'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: choseVideo(),
          child: Icon(Icons.video_library),
        ),
      ),
    );
  }
  choseVideo() async{
    videoURL = pickVideo();
    _initializeVideoPlayer();
  }
  void  _initializeVideoPlayer(){
    _controller = VideoPlayerController.file(
      File(videoURL!))
      ..initialize().then((_) {
        setState(() {
          _controller!.play();
        });
      }
    );
  }
  Widget videoPreviewWidget(){
    if(_controller!=null){
      return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      );
    }
    else{
      return const CircularProgressIndicator();
    }
  }
}
