import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_source/remote/news_api_services.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecase/get_article_use_case.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(
    Dio(),
  );
  sl.registerSingleton<NewsApiServices>(
    NewsApiServices(
      sl(),
    ),
  );
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(
      sl(),
    ),
  );

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(
      sl(),
    ),
  );

  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(
      sl(),
    ),
  );
}
