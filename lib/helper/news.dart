import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news =[];

  Future<void> getNews() async{
    String url ="https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=6568af3c82d24a609133ab5e07393efc";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData['articles'].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['contents']
          );
          news.add(articleModel);
        }
      });
    }
  }  
}


class CategoryNewsClass {
  List<ArticleModel> news =[];

  Future<void> getNews(String category) async{
    String url ="https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=6568af3c82d24a609133ab5e07393efc";
    //String url ="https://newsapi.org/v2/top-headlines?category=$category&sources=bbc-news&apiKey=6568af3c82d24a609133ab5e07393efc";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData['articles'].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['contents']
          );
          news.add(articleModel);
        }
      });
    }
  }  
}