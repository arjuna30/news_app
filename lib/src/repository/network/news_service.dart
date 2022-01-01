import 'package:dio/dio.dart';
import 'package:news_app/src/model/article.dart';

class NewsService {
  final Dio _dio;
  const NewsService(this._dio);

  Future<List<Article>> getArticles() async {
    final articles = <Article>[];
    const _url = '/api/innocent/newsapp/articles';
    final response = await _dio.get(_url);
    final data = response.data as List;
    for (final dataArticle in data) {
      final article = Article.fromJson(dataArticle);
      articles.add(article);
    }
    return articles;
  }
}
