import 'package:news_app/main.dart';
import 'package:news_app/src/repository/model/news_response.dart';
import 'package:news_app/src/repository/model/base_response.dart';
import 'package:news_app/src/repository/network/controller/network_service.dart';

class NewsService extends NetworkService {
  NewsService(super.network);

  Future<BaseResponse<NewsDetail>> getTopHeadlines(
      [String? countryCode]) async {
    const _url = '/top-headlines';
    final response = await network.get(_url,
        cancelToken: injector.get(), queryParameters: {'country': 'US'});
    return defaultHttpResponseConverter<NewsDetail>(response);
  }
}
