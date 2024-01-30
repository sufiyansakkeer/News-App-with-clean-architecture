import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';

/// A use case is a piece of business logic that represents a single task that
/// the system needs to perform.Use cases define the operations or actions that
/// can be performed in the application. They represent a logical unit of work
/// that's an application can perform in response to your user's request or an
/// event.
///  All a `useCase` will `Do` is getting `Data` from a `Repository` And
/// every `useCase` should have one method `call()`. But the interface should be
/// same to prevent confusion.
class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  // use case use the repository to implement the function
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
