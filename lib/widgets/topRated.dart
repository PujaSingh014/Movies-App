import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';

class TopRated extends StatelessWidget {
  TopRated({required this.topRated});
  final List topRated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: styled_text(text:"Top Rated Movies", size: 20,),
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Description(
                        name: topRated[index]['title']!=null?topRated[index]['title']:"Not Loaded",
                        bannerUrl:'https://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'] ,
                        posterUrl:'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'] ,
                        description: topRated[index]['overview']!=null?topRated[index]['overview']:"Not Loaded",
                        vote: topRated[index]['vote_average']!=null?topRated[index]['vote_average'].toString():"Not Loaded",
                        launch_on: topRated[index]['release_date']!=null?topRated[index]['release_date']:"Not Loaded",
                      )));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          if(topRated[index]['poster_path']!=null)
                            Container(
                              height:200,

                              decoration: BoxDecoration(image: DecorationImage(

                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path']
                                  )
                              )),
                            ),
                          SizedBox(height: 10,),
                          Container(
                            child: styled_text(text: topRated[index]['title']!=null?topRated[index]['title']:"Loading",),
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
