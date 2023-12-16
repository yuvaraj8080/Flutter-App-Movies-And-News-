import 'package:flutter/material.dart';
import 'package:tech_newa_flutter_app/Movies%20App/text.dart';
class Discription extends StatelessWidget {

  final String name ,description, bannerurl, posturl, vote, launch_on;

  const Discription({super.key, required this.name, required this.description, required this.bannerurl, required this.posturl, required this.vote, required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors:[
      Color(0xff000000),
      Color(0xff434343),
      Color(0xff000000),
    ])),
      child: Scaffold(
        backgroundColor:Colors.black38,
        body:Container(child:ListView(children:[
          Container(height:250,child:Stack(children:[
            Positioned(child:Container(height:250,
            width:MediaQuery.of(context).size.width,
              child: Image.network(bannerurl, fit:BoxFit.cover),
            )),
            Positioned(bottom:7,
                child:modified_text(text:"  ⭐ Avarage Rating: "+ vote, color:Colors.white, size: 18,)),
          ])),
          SizedBox(height:40),
          Container(padding: EdgeInsets.all(10),
              child:modified_text(text:name!=null ? name : "Not Loading", color: Colors.blue, size:25,)),
          Container(padding:EdgeInsets.only(left:15),child:modified_text(text:"Releasing on -" + launch_on,size:18, color: Colors.white,)),
          Row(children:[
            Container(margin:EdgeInsets.all(7),
            height:250,width:100,
              child:Image.network(posturl),
            ),
            Flexible(child: Container(child:modified_text(text:description,size:17,color:Colors.white,)))
          ])

        ]))
      ),
    );
  }
}
