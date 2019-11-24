import 'package:flutter/material.dart';
import 'package:music_info/models/response.dart';
import 'package:music_info/widgets/song_info_widget.dart';
import 'package:music_info/widgets/thumbnail_widget.dart';
import 'package:music_info/widgets/youtube_widget.dart';

class SongInfoScreen extends StatelessWidget {
  SongInfoScreen({Key key, this.res}) : super(key: key);

  final Response res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${res.songName} - ${res.artist}'),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
            child: SongInfoWidget(
              info: res,
            ),
          ),
          Flexible(
            child: YoutubeWidget(
              ytLink: res.ytVideo,
            ),
          ),
          Flexible(
              child: ThumbnailWidget(
            thumbnail: res.thumbnails,
          ))
        ],
      ),
    );
  }
}
