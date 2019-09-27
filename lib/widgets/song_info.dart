import 'package:flutter/material.dart';
import 'package:music_info/models/response.dart';

class SongInfo extends StatelessWidget {
  SongInfo({Key key, this.res}) : super(key: key);

  final Response res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${res.songName}'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text(
                  res.songName,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),
                ),
                subtitle: Text(
                  res.artist,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.disc_full),
                title: Text(
                  res.albumTitle,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
                ),
                subtitle: Text(
                  res.releaseDate,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
                ),
              ),
              _getYouTube(),
              _getThumbnail(),
            ],
          ),
        ));
  }

  Widget _getYouTube() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: FlatButton(
        onPressed: (() {
          _launchURL(res.ytVideo);
        }),
        child: Image.asset(
          'assets/images/yt_logo_mono_light.png',
          height: 25.0,
        ),
      ),
    );
  }

  Widget _getThumbnail() {
    String imgURL = '';

    if (res.thumbnails.highQuality == null) {
      if (res.thumbnails.standard != null) imgURL = res.thumbnails.standard;
    } else
      imgURL = res.thumbnails.highQuality;

    return Image.network(
      imgURL,
    );
  }

  _launchURL(String url) async {
    print('Launching YouTube... ');
    print('$url');
//
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      print('An error occurred');
//      throw 'Could not launch $url';
//    }
  }
}
