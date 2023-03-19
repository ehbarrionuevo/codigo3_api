import 'package:codigo3_api/models/news_model.dart';
import 'package:codigo3_api/services/api_service.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias"),
      ),
      body: FutureBuilder(
        future: apiService.getNews(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<NewsModel> news = snap.data;
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(
                    news[index].imagen,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(news[index].titulo),
                  subtitle: Text(news[index].fecha.toString()),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
