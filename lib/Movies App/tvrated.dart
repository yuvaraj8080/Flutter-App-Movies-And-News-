import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_newa_flutter_app/Movies%20App/discription.dart';
import 'package:tech_newa_flutter_app/Movies%20App/text.dart';

class TV extends StatelessWidget {
  final List tvrated;

  const TV({Key? key, required this.tvrated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular TV Shows',
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Container(
            height: 195,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvrated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Discription(
                          name: tvrated[index]['original_name'] ?? 'Unknown Name',
                          bannerurl:
                          'https://image.tmdb.org/t/p/w500' + (tvrated[index]['backdrop_path'] ?? ''),
                          posturl:
                          'https://image.tmdb.org/t/p/w500' + (tvrated[index]['poster_path'] ?? ''),
                          description: tvrated[index]['overview'] ?? 'No description available',
                          vote: (tvrated[index]['vote_average'] ?? 0.0).toString(),
                          launch_on: tvrated[index]['release_date'] ?? 'Unknown Date',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' + (tvrated[index]['backdrop_path'] ?? ''),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 140,
                        ),
                        SizedBox(height: 1),
                        Container(
                          child: modified_text(
                            size: 15,
                            text: tvrated[index]['original_name'] ?? 'Unknown',
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
