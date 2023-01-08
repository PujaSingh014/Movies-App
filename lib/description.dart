import 'package:flutter/material.dart';
import 'package:movies_app/screens/Side_menu.dart';
import 'package:movies_app/utils/text.dart';

class Description extends StatelessWidget {

  Description({required this.name, required this.description, required this.bannerUrl, required this.posterUrl, required this.vote, required this.launch_on});

  final String name, description, bannerUrl, posterUrl, vote, launch_on;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: styled_text(text: 'Flutter Movies App', size: 20),
        backgroundColor: Colors.red[900],
      ),
      drawer: NavDrawer(),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerUrl, fit: BoxFit.fitHeight,),
                  )),
                  Positioned(
                    bottom: 10,
                      child: styled_text(text: ' ⭐ Average Rating is '+vote, size: 15,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: styled_text(text: name, size: 20,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: styled_text(text: "Releasing on "+launch_on, size: 12,),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterUrl),
                ),
                Flexible(
                  child: Container(
                    child: styled_text(text: description, size: 15,),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
