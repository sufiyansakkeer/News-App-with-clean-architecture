import 'package:news_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';

class GetSavedArticlesUseCase extends UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticlesUseCase(this._articleRepository);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticle();
  }
}
