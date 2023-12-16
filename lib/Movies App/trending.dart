import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_newa_flutter_app/Movies%20App/discription.dart';
import 'package:tech_newa_flutter_app/Movies%20App/text.dart';


class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending Movies',style:GoogleFonts.roboto(
              fontSize:20,fontWeight:FontWeight.bold,color:Colors.blue)),
          SizedBox(height:5),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Discription(
                                  name: trending[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500'+
                                      trending[index]['backdrop_path'],

                                  posturl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],

                                  description: trending[index]['overview'],
                                  vote: trending[index]['vote_average'].toString(),
                                  launch_on: trending[index]
                                  ['release_date'],
                                )));
                      },
                      child: trending[index]["title"]!=null?Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  text: trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : 'Loading', color: Colors.white,),
                            )
                          ],
                        ),
                      ):Container(),
                    );
                  }))
        ],
      ),
    );
  }
}