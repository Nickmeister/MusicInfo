import 'package:flutter/material.dart';
import 'package:music_info/models/response.dart';
import 'package:music_info/models/response_thumbnail.dart';
import 'package:music_info/utils/rest_helper_util.dart';
import 'package:music_info/screens/song_info_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _responseBody = "";
  bool bShowAnimation = false;
  TextEditingController _inputTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _updateText(String text) {
    if (text == null) text = "No results";

    // Update label text
    setState(() {
      _responseBody = text;
    });
  }

  void _postRequest() async {
    if (_inputTextController.text.isEmpty) {
      _updateText('Please enter a song title');
      return;
    }

    _updateText('Searching for song info...');
    bShowAnimation = true;

    try {
      var res = await RestHelperUtil.searchForSong(_inputTextController.text);

      _updateText('');

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SongInfoScreen(
                  res: res,
                )),
      );
    } catch (error) {
      _updateText(error.toString().replaceAll('Exception: ', ''));
    } finally {
      bShowAnimation = false;
    }
  }

  void _demoRequest() async {
    _updateText('');

    Response demoResp = Response(
        artist: 'Pink Floyd',
        songName: 'Comfortably Numb',
        genre: ['Rock'],
        releaseDate: '1979',
        albumTitle: 'The Wall',
        ytVideo: 'https://www.youtube.com/watch?v=FrOQC-zEog',
        thumbnails: ResponseThumbnail(highQuality: 'https://img.youtube.com/vi/_FrOQC-zEog/sddefault.jpg', standard: 'https://img.youtube.com/vi/_FrOQC-zEog/sddefault.jpg'));

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SongInfoScreen(
                res: demoResp,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: <Widget>[
          Padding(
            child: Icon(Icons.music_video),
            padding: EdgeInsets.only(right: 7.0),
          ),
          Text(widget.title),
        ],
      )),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _getSearchBar(),
              _getResults(),
              Visibility(
                visible: bShowAnimation,
                child: Image.asset(
                  'assets/animations/loading.gif',
                  height: 100.0,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
//        onPressed: _demoRequest,
        onPressed: _postRequest,
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }

  Widget _getSearchBar() {
    return TextField(
      controller: _inputTextController,
      decoration: InputDecoration(
        hintText: "Search for a song",
      ),
    );
  }

  Widget _getResults() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(
        _responseBody,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
