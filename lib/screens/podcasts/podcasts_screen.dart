import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:trackcorona/viewmodels/podcasts/podcasts_list_view_model.dart';
import 'package:trackcorona/viewmodels/podcasts/podcasts_view_model.dart';
import 'package:trackcorona/widgets/covid19/custom_appbar.dart';

typedef void OnError(Exception exception);

String curPlaying = "Currently Playing:None";
String durMaxMus = "00:00:00";
String durActiveMus = "00:00:00";

class PodcastsScreen extends StatefulWidget {
  @override
  _PodcastsScreenState createState() => new _PodcastsScreenState();
}

class _PodcastsScreenState extends State<PodcastsScreen> {
  Duration _durationM = new Duration();
  Duration _positionM = new Duration();

  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();

    Provider.of<PodcastsListViewModel>(context, listen: false).allPodcastss();
    initPlayer();
  }

  Widget _buildList(PodcastsListViewModel clvm) {
    switch (clvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: listOfPodcasts(clvm.podcasts),
        );
      // child: _buildPodcastsWebView(clvm.podcasts));
      case LoadingStatus.empty:
        return Center(
          child: Text("No results found"),
        );
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _durationM = d;

          var MaxM = Duration(seconds: _durationM.inSeconds.toInt());
          durMaxMus = _printDuration(MaxM);
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _positionM = p;

          var ActiveM = Duration(seconds: _positionM.inSeconds.toInt());
          durActiveMus = _printDuration(ActiveM);
        });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel =
        Provider.of<PodcastsListViewModel>(context, listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 20,
          color: Colors.lightBlueAccent,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              height: 85,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Text("$curPlaying"),
                        Row(
                          children: <Widget>[
                            Text("$durActiveMus"),
                            Slider(
                                activeColor: Colors.white,
                                inactiveColor: Colors.white70,
                                value: _positionM.inSeconds.toDouble(),
                                min: 0.0,
                                max: _durationM.inSeconds.toDouble(),
                                onChanged: (double value) {
                                  setState(() {
                                    seekToSecond(value.toInt());
                                    value = value;
                                  });
                                }),
                            Text("$durMaxMus"),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: CustomAppBar(
          titleName: "PodCast",
        ),
        body: _buildList(listViewModel),
      ),
    );
  }

  listOfPodcasts(List<PodcastsViewModel> podcasts) {
    return ListView.builder(
      itemCount: podcasts.length,
      itemBuilder: (context, index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Center(
                          child: CircleAvatar(
                            radius: 40,
                            // maxRadius: 40,
                            backgroundImage: NetworkImage(
                                // "https://aleteiaen.files.wordpress.com/2020/03/web3-pregnant-pregnancy-sick-virus-mask-coronavirus-healthshutterstock_1673560603.jpg",
                                podcasts[index].imageUrl),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Padding(
                          padding: new EdgeInsets.only(right: 13.0),
                          child: Text(
                            podcasts[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            // textAlign: TextAlign.center
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            // softWrap: false,
                            // overflow: TextOverflow.fade,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Padding(
                          padding: new EdgeInsets.only(right: 20.0),
                          child: Text(
                            podcasts[index].summary,
                            textDirection: TextDirection.ltr,
                            // textAlign: TextAlign.left
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            // softWrap: false,
                          ),
                        ),
                      ),
                      Text(
                        " via: ${podcasts[index].source}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Center(
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: new Icon(Icons.play_circle_filled),
                              onPressed: () {
                                setState(() {
                                  isPlaying = true;
                                });
                                curPlaying =
                                    "Currently Playing: ${podcasts[index].title}";
                                advancedPlayer.play(
                                    // 'https://assets.rumsan.com/askbhunte/assets/child-psychologist-coronavirus.mp3'

                                    podcasts[index].audioUrl);
                              },
                            ),
                            IconButton(
                              icon: new Icon(Icons.pause_circle_filled),
                              onPressed: () {
                                advancedPlayer.pause();
                                setState(() {
                                  isPlaying = false;
                                });
                              },
                            ),
                            IconButton(
                              icon: new Icon(Icons.stop),
                              onPressed: () {
                                curPlaying = "Currently Playing:None";
                                advancedPlayer.stop();
                                setState(() {
                                  isPlaying = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
