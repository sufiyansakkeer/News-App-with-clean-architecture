import 'package:news_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';

class DeleteArticleUseCase extends UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  DeleteArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) async {
    return _articleRepository.deleteArticle(params!);
  }
}
