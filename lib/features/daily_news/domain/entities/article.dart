// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const ArticleEntity({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override

  /// props comes with equatable package . which used to compare two objects
  List<Object?> get props => [
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
