import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_newa_flutter_app/Movies%20App/discription.dart';
import 'package:tech_newa_flutter_app/Movies%20App/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({super.key, required this.toprated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Rated Movies',style:GoogleFonts.roboto(
              fontSize:20,fontWeight: FontWeight.bold,color:Colors.blue)),
          SizedBox(height:5),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Discription(
                                name: toprated[index]['title'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500'+
                                    toprated[index]['backdrop_path'],

                                posturl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],

                                description: toprated[index]['overview'],
                                vote: toprated[index]['vote_average'].toString(),
                                launch_on: toprated[index]
                                ['release_date'],
                              )));
                    },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  text: toprated[index]['title'] != null
                                      ? toprated[index]['title']
                                      : 'Loading', color: Colors.white,),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}