// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

/// `Entities` are the Data types and classes that we send and receive from API or
/// any other ways Model class will implement this entity and add the from json,
/// to json functions in it.
/// here we use `Equatable` to easy valuable comparison
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
  /// This property will consider which object we should consider for comparison
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
