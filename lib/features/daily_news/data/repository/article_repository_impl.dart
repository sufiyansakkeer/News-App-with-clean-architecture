import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/api_key.dart';
import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_source/local/app_database.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_source/remote/news_api_services.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';

/// Implementation of article repository
class ArticleRepositoryImpl extends ArticleRepository {
  /// here we changed the `list<ArticleEntity>` to `List<ArticleModel`
  /// because we should not use entities in the data layer

  /// Here we fetch the data from the Data layer , currently our data is from api
  /// which available in `NewsApiServices`

  final NewsApiServices _newsApiServices;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiServices, this._appDatabase);
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

  @override
  Future<void> deleteArticle(ArticleEntity articleEntity) async {
    return _appDatabase.articleDAO.deleteArticle(
      ArticleModel.fromEntity(
        articleEntity,
      ),
    );
  }

  @override
  Future<List<ArticleModel>> getSavedArticle() async {
    return _appDatabase.articleDAO.getAllArticle();
  }

  @override
  Future<void> saveArticle(ArticleEntity articleEntity) async {
    return _appDatabase.articleDAO.insertArticle(
      ArticleModel.fromEntity(
        articleEntity,
      ),
    );
  }
}
