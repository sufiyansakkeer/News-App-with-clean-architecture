// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecase/delete_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecase/get_saved_articles.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecase/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;
  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._deleteArticleUseCase,
  ) : super(LocalArticleLoading()) {
    on<GetAllArticles>((event, emit) async {
      final articles = await _getSavedArticleUseCase();
      log(articles.length.toString(), name: "articles length in bloc");
      return emit(LocalArticleDone(articles));
    });
    on<DeleteArticle>((event, emit) async {
      await _deleteArticleUseCase(params: event.articleEntity);
      add(const GetAllArticles());
    });
    on<SaveArticle>((event, emit) async {
      await _saveArticleUseCase(params: event.articleEntity);
      add(const GetAllArticles());
    });
  }
}
