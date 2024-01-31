import 'package:floor/floor.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';

/// Here we use the `Model` instead of `Entity` because  the domain layer must be
/// independent and not depend on other layers and if we want to use `Entity`
/// instead `Model` in the data layer we may change our database in the future or
/// use XML instead of Json and we have to again change the `Entity` which is against the
/// rule of clean architecture
/// And also `Model` contains the from json , to json methods

@Entity(
    tableName:
        "article") // In floor by marking the entity with `@Entity` annotation it become table and the fields inside it will become column
class ArticleModel extends ArticleEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  const ArticleModel({
    this.id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != ""
          ? map['urlToImage']
          : "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content);
  }
}
