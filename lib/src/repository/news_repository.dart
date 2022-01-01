import 'package:news_app/src/model/article.dart';
import 'package:news_app/src/repository/network/news_service.dart';

class NewsRepository {
  final NewsService _newsService;
  const NewsRepository(this._newsService);

  Future<List<Article>> getArticles() async => _newsService.getArticles();
}
