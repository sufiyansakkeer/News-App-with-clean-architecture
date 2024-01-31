part of 'local_article_bloc.dart';

sealed class LocalArticleEvent extends Equatable {
  const LocalArticleEvent({this.articleEntity});
  final ArticleEntity? articleEntity;
  @override
  List<Object> get props => [articleEntity!];
}

class GetAllArticles extends LocalArticleEvent {
  const GetAllArticles();
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntity articleEntity)
      : super(
          articleEntity: articleEntity,
        );
}

class DeleteArticle extends LocalArticleEvent {
  const DeleteArticle(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}
