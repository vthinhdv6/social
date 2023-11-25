import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social/presentation/screen/video_social_screen/enitiesHome.dart';

import '../../../common/constant/contant.dart';

class VideoSocialSingleFile extends StatelessWidget {
  static const double NavigationIconSize = 20.0;
  static const double ActionWidgetSize = 60.0;
  static const double ActionIconSize = 35.0;
  static const double ShareActionIconSize = 25.0;
  static const double ProfileImageSize = 50.0;
  static const double ActionIconGap = 12.0;
  static const double FollowActionIconSize = 25.0;
  static const double CreateButtonWidth = 38.0;
  static const primaryColor = Color(0xFF333333);
  static const secondaryColor = Color(0xFF999999);

  VideoSocialSingleFile({super.key, required this.numberLike});
  int numberLike;
  final _numberStream = enitiesHome();
  Widget get followingContainer => Container(
        height: 100.0,
        padding: EdgeInsets.only(bottom: 15.0),
        alignment: Alignment(0.0, 1.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Following'),
              Container(
                width: 15.0,
              ),
              Text('For you', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold))
            ]),
      );

  Widget get videoDescription => Expanded(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '@firstjonny',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 10.0,
              ),
              Text('Video title and some other stuff'),
              Container(
                height: 10.0,
              ),
              Row(children: [
                Icon(Icons.music_note, color: Colors.white, size: 15.0),
                Container(
                  width: 10.0,
                ),
                Text('Artist name', style: TextStyle(fontSize: 12.0)),
                Container(
                  width: 10.0,
                ),
                Text('Song name', style: TextStyle(fontSize: 12.0))
              ]),
              Container(
                height: 12.0,
              ),
            ]),
      ));

  Widget get actionsToolbar => Container(
        width: 100.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getProfileVideoAction(pictureUrl: ''),
            StreamBuilder<int>(
              stream: _numberStream.numberStream,
                builder:(context,snapshot)
             {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return GestureDetector(
                      onTap: () {
                        _handleTap();
                      },
                      child: _getVideoAction(title: snapshot.data.toString(), icon: Icons.heart_broken),

                    );
                  }
                }),
            //     child: GestureDetector(
            //   child: _getVideoAction(title: numberLike.toString(), icon: Contants.heart),
            //   onTap: () {},
            // )),
            // _getVideoAction(title: '16.4k', icon: Contants.chat_bubble),
            _getVideoAction(title: 'asdasd', icon: Contants.reply, isShare: true),
            _getMusicPlayerAction()
          ],
        ),
      );

  LinearGradient musicGradient = LinearGradient(
    colors: [primaryColor, secondaryColor, secondaryColor, primaryColor],
    stops: [0.0, 0.4, 0.6, 1.0],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  Widget _getMusicPlayerAction() {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(11.0),
            height: ProfileImageSize,
            width: ProfileImageSize,
            decoration: BoxDecoration(
                gradient: musicGradient, borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
            child: CachedNetworkImage(
              imageUrl: "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        ]));
  }

  Widget get centerSection => Expanded(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[videoDescription, actionsToolbar]));

  Widget get customCreateIcon => Container(
      width: 45.0,
      height: 27.0,
      child: Stack(children: [
        Container(
            margin: EdgeInsets.only(left: 10.0),
            width: CreateButtonWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7.0))),
        Container(
            margin: EdgeInsets.only(right: 10.0),
            width: CreateButtonWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7.0))),
        Center(
            child: Container(
          height: double.infinity,
          width: CreateButtonWidth,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7.0)),
          child: Icon(
            Icons.add,
            size: 20.0,
          ),
        )),
      ]));

  Widget get navigationBar => Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Contants.home, color: Colors.white, size: NavigationIconSize),
          Icon(Contants.search, color: Colors.white, size: NavigationIconSize),
          customCreateIcon,
          Icon(Contants.messages, color: Colors.white, size: NavigationIconSize),
          Icon(Contants.profile, color: Colors.white, size: NavigationIconSize)
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            followingContainer,
            centerSection,
            Opacity(opacity: 0.1, child: Container(height: 1.0, color: Colors.grey[300])),
            navigationBar,
          ],
        ),
      ),
    );
  }

  Widget _getVideoAction({required String title, required IconData icon, bool isShare = false}) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Column(children: [
          Icon(icon, size: isShare ? ShareActionIconSize : ActionIconSize, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child: Text(title, style: TextStyle(fontSize: isShare ? 10.0 : 12.0)),
          )
        ]));
  }

  Widget _getProfileVideoAction({required String pictureUrl}) {
    return Stack(children: [
      Container(
          margin: EdgeInsets.only(top: 10.0),
          width: ActionWidgetSize,
          height: ActionWidgetSize,
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(1.0),
              height: ProfileImageSize,
              width: ProfileImageSize,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
              child: CachedNetworkImage(
                imageUrl: "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          ])),
      Positioned(
          width: 15.0,
          height: 15.0,
          bottom: 5,
          left: ((ActionWidgetSize / 2) - (15 / 2)),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          )),
      Positioned(
          bottom: 0,
          left: ((ActionWidgetSize / 2) - (FollowActionIconSize / 2)),
          child: Icon(Icons.add_circle,
              color: Color.fromARGB(255, 255, 43, 84), size: FollowActionIconSize))
    ]);
  }

  Future<int> changeLikeNumber() async {
    return numberLike;
  }
  Future<void> changeLikeNumberFuture() async {
    numberLike++;
  }
  void _handleTap() {
    _numberStream.incrementNumber();
  }
}
