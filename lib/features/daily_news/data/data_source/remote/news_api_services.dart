import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';

part 'news_api_services.g.dart';

/// `@RestApi` this annotation helps generator to know this is retrofit
@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiServices {
  factory NewsApiServices(Dio dio) = _NewsApiServices;

  /// here we are wrapping the response with `HttpResponse` , because we need the details of our response
  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
