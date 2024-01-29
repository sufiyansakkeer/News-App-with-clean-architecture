import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';

/// In this page we are only creating abstract class
abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
