import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_newa_flutter_app/Movies%20App/toprated.dart';
import 'package:tech_newa_flutter_app/Movies%20App/trending.dart';
import 'package:tech_newa_flutter_app/Movies%20App/tvrated.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '18fc0359a3f692badb484a28855a303e';
  final String readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOGZjMDM1OWEzZjY5MmJhZGI0ODRhMjg4NTVhMzAzZSIsInN1YiI6IjY1N2YxOWU2Mzk0YTg3MDg3NzczNGFjMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nuI1RrMtZ8oob2RpWjwWKR750NlD49PNK3LBMi58agw';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingResult['results'];
      topratedmovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color(0xff434343),elevation: 4,shadowColor: Colors.white,
        title: Text(
          'Flutter Movie App ️',
          style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors:[
          Color(0xff000000),
          Color(0xff434343),
          Color(0xff000000),
        ])),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TV(tvrated: tv, key: Key('tv_key')),
            ),
            SliverToBoxAdapter(
              child: TrendingMovies(trending: trendingmovies, key: Key('trending_key')),
            ),
            SliverToBoxAdapter(
              child: TopRatedMovies(toprated: topratedmovies),
            ),
          ],
        ),
      ),
    );
  }
}
