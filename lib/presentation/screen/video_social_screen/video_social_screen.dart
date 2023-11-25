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
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
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
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ))),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '100 bình luận',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commentBox('https://www.bing.com/images/search?view=detailV2&ccid=VOnsU2Xu&id=43719B052845A43462643D94005CAE74F0D8E787&thid=OIP.VOnsU2XuuWeDj_0qNe2lCwEREs&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.54e9ec5365eeb967838ffd2a35eda50b%3frik%3dh%252bfY8HSuXACUPQ%26riu%3dhttp%253a%252f%252fwww.hotavatars.com%252fwp-content%252fuploads%252f2019%252f01%252fI80W1Q0.png%26ehk%3dNSQkB5B%252fUOzON7Gd8fGH9%252bEBxOki2BAu6FdDH0E1TGY%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=526&expw=480&q=Internet+Avatar&simid=608014550475933910&FORM=IRPRST&ck=39A005682C83A19DD29D5409B4867370&selectedIndex=1','thu thao','day la video dau tien'),
                          ],
                        ),
                      )
                    ],
                  ),
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
        ));
  }
}
Widget commentBox(String  avtUrl, String userName,String contentCmt){
  return  SizedBox(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            foregroundImage: NetworkImage('https://th.bing.com/th/id/OIP.VOnsU2XuuWeDj_0qNe2lCwEREs?w=148&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                ),
                Text(
                  contentCmt,
                  maxLines: 10,
                ),
                const Row(
                  children: [
                    Text(
                      '16 giờ'
                    ),
                    Text('Trả lời'),
                    Icon(Icons.headphones),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    ),
  );
}
Widget get topSection => Container(
      height: 100.0,
      padding: const EdgeInsets.only(bottom: 15.0),
      alignment: const Alignment(0.0, 1.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Following',
              style: TextStyle(color: Colors.white),
            ),
            Container(
              width: 15.0,
            ),
            const Text('For you',
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
