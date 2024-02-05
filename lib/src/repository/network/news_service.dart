import 'package:news_app/main.dart';
import 'package:news_app/src/model/article.dart';
import 'package:news_app/src/repository/network/controller/network_controller.dart';

class NewsService {
  final NetworkController _network;
  const NewsService(this._network);

  Future<List<Article>> getArticles() async {
    final articles = <Article>[];
    const _url = '/api/innocent/newsapp/articles';
    final response = await _network.get(_url, cancelToken: injector.get());
    final data = response.data as List;
    for (final dataArticle in data) {
      final article = Article.fromJson(dataArticle);
      articles.add(article);
    }
    return articles;
  }
}
