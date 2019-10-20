import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeWidget extends StatelessWidget {
  YoutubeWidget({Key key, this.ytLink}) : super(key: key);

  final String ytLink;

  _launchURL(String url) async {
    print('Launching YouTube... ');
    print('$url');

    if (url.isNotEmpty) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('An error occurred');
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: FlatButton(
        onPressed: (() {
          _launchURL(this.ytLink);
        }),
        child: Image.asset(
          'assets/images/yt_logo_mono_light.png',
          height: 25.0,
        ),
      ),
    );
  }
}
