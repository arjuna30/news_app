import 'package:news_app/src/repository/model/news_response.dart';
import 'package:news_app/src/repository/model/base_response.dart';
import 'package:news_app/src/repository/network/news_service.dart';

class NewsRepository {
  final NewsService _newsService;
  const NewsRepository(this._newsService);

  Future<BaseResponse<NewsDetail>> getTopHeadlines() async =>
      _newsService.getTopHeadlines();
}
