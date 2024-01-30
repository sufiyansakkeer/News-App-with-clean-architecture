import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';

/// In this page we are only creating abstract class and the implementation will
/// be in data layer repository.
/// `Repository` is the bridge between `Data layer` and `Domain layer`.
/// `Repository` is responsible for co-ordination of data from different sources.
/// In `Domain layer` `Repository` are abstract classes which we need to
/// implements in `Data layer`.
abstract class ArticleRepository {
  /// Here we wrap the response with `DataState` to determine the Response state
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
