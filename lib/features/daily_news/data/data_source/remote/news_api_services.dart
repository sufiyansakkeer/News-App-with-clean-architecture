import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';

part 'news_api_services.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiServices {
  factory NewsApiServices(Dio dio) = _NewsApiServices;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
