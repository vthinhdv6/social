import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../common/widget/action_toolbar_widget.dart';
import '../../../common/widget/bottom_toolbar.dart';
import '../../../common/widget/video_shared.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(


                child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width:   _controller.value.size.width,
                      height:   _controller.value.size.height,
                      child: AspectRatio(
                        aspectRatio:  _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )

                    )

                ),

              ),
              Column(
                children: <Widget>[
                  // Top section
                  topSection,

                  // Middle expanded
                  middleSection,

                  // Bottom Section
                  BottomToolbar(),
                ],
              ),
            ],

          ),
        )

    );
  }
}

Widget get topSection => Container(
      height: 100.0,
      padding: EdgeInsets.only(bottom: 15.0),
      alignment: Alignment(0.0, 1.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Following',
              style: TextStyle(color: Colors.white),
            ),
            Container(
              width: 15.0,
            ),
            Text('For you',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ))
          ]),
    );

Widget get middleSection => Expanded(
    child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[VideoDescription(), ActionsToolbar()]));

