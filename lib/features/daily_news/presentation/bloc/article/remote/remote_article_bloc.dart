import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecase/get_article_use_case.dart';
part 'remote_article_event.dart';
part 'remote_article_state.dart';

/// we call the use cases only inside the bloc or any other state management
///
/// In Dart a method name call can be run both by calling `object.call()` and also
/// by `object()` that's the perfect method to use in the use cases so we call in
/// this way and save
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
