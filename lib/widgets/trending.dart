import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/description.dart';

class TrendingMovies extends StatelessWidget {
  TrendingMovies({required this.trending});
  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: styled_text(text:"Trending Movies", size: 20,),
          ),
          SizedBox(height: 10,),
          Container(
            height: 210,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Description(
                        name: trending[index]['title']!=null?trending[index]['title']:"Not Loaded",
                        bannerUrl:'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'] ,
                        posterUrl:'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'] ,
                        description: trending[index]['overview']!=null?trending[index]['overview']:"Not Loaded",
                        vote: trending[index]['vote_average']!=null?trending[index]['vote_average'].toString():"Not Loaded",
                        launch_on: trending[index]['release_date']!=null?trending[index]['release_date']:"Not Loaded",
                    )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                      if(trending[index]['backdrop_path']!=null)
                        Container(
                          height:160,

                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15),
                           image: DecorationImage(

                            image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path']
                            ),
                            fit: BoxFit.cover,
                          )),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: styled_text(text: trending[index]['title']!=null?trending[index]['title']:"Loading",),
                        )
                      ],
                    ),
                  ),
                );
                }),
          )
        ],
      ),
    );
  }
}
