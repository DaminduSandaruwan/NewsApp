import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile({@required this.imageUrl,@required this.title,@required this.desc, @required this.url});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(
            blogUrl: url,
          ),
        ));
      },
      child: Container(
        color: Colors.black,
        margin: EdgeInsets.only(bottom:16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 7,),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 7,),
            Text(
              desc,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}