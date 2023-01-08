

import 'package:flutter/material.dart';
import 'package:movies_app/screens/Side_menu.dart';
import 'package:movies_app/widgets/nowPlaying.dart';
import 'package:movies_app/widgets/searchMovies.dart';
import 'package:movies_app/widgets/topRated.dart';
import 'package:movies_app/widgets/trending.dart';
import 'package:movies_app/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List nowPlayingMovies = [];

  final String apiKey = 'f99e50346364b722f5b037a2c5ec84be';

  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOTllNTAzNDYzNjRiNzIyZjViMDM3YTJjNWVjODRiZSIsInN1YiI6IjYyY2E5ZTdjZWVhMzRkMDA1MDRkNGRmMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XaeLXTZsTx5gzM00fqW_V5e3hOoUOqmnCZex31ITDIA';

  @override
 void initState(){
    loadMovies();
    super.initState();
  }



  loadMovies() async{
    TMDB tmdbwithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(

          showLogs: true,
          showErrorLogs: true,

        ));
    Map trendingResult = await tmdbwithCustomLogs.v3.trending.getTrending();
    Map topratedResult = await tmdbwithCustomLogs.v3.movies.getTopRated();
    Map nowplayingResult = await tmdbwithCustomLogs.v3.movies.getNowPlaying();

    setState(() {
      trendingMovies =trendingResult['results'];
      topRatedMovies =topratedResult['results'];
      nowPlayingMovies = nowplayingResult['results'];
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: styled_text(text: 'Flutter Movies App', size: 20),
          backgroundColor: Colors.red[900],
        ),
        drawer: NavDrawer(),
        body:
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (value) {
                      SearchMovies(keyword: value);
                    },
                    cursorColor: Colors.grey[300],
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      filled: true,
                      fillColor: Colors.grey[900],
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search_sharp),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                TrendingMovies(trending: trendingMovies),
                TopRated(topRated: topRatedMovies),
                NowPlaying(nowPlaying: nowPlayingMovies)
            ]),


      ),
    );
  }
}
