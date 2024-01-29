import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/api_key.dart';
import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_source/remote/news_api_services.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  /// here we changed the `list<ArticleEntity>` to `List<ArticleModel`
  /// because we should not use entities in the data layer

  final NewsApiServices _newsApiServices;
  ArticleRepositoryImpl(this._newsApiServices);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiServices.getNewsArticle(
        apiKey: APIs().apiKey,
        category: category,
        country: country,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusCode,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
