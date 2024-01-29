import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecase/get_article_use_case.dart';
part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase getArticleUseCase;
  RemoteArticleBloc(this.getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticle>(
      (event, emit) async {
        log("inside remote article getArticle function");
        final dataState = await getArticleUseCase();
        if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
          log(dataState.data.toString());
          return emit(RemoteArticleDone(dataState.data!));
        }
        if (dataState is DataFailed) {
          emit(RemoteArticleError(dataState.error!));
        }
      },
    );
  }
}
