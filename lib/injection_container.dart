import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_source/remote/news_api_services.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository_interface/article_repository.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecase/get_article_use_case.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

/// we want way to register and access all objects inside our app for this we
/// need to use service locator pattern.  In flutter `get_it` allows us to
/// register all objects and their dependencies at startup and access all
/// registered objects from a single Source. Instead of passing the constructor
/// every data that depend on it we can use get it.

// we declared it global we can access any where.
final sl = GetIt.instance;

/// this function should call before `runApp`. All the `contract` and `classes` will
/// be registered inside this function
Future<void> initializeDependencies() async {
  /// `Classes` can be registered in two ways `factory` and `singleton`.
  ///
  /// `factory` : will create new instance when ever we create an instance
  /// `singleton` : will give the same instance for the app life cycle
  ///
  /// `registerSingleton` method to register `singleton` and `registerFactory` to register `factory`

  /// dio
  sl.registerSingleton<Dio>(
    Dio(),
  );

  /// dependencies
  sl.registerSingleton<NewsApiServices>(
    NewsApiServices(
      sl(),
    ),
  );
  // In article repository they depend on the contract not on the concrete
  // implementation , however we cannot instantiate a contract which is an
  // abstract class instead we have to instantiate the  implementation of
  // repository then we need to register the useCase
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(
      sl(),
    ),
  );

  /// usecase
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(
      sl(),
    ),
  );

  /// Bloc , it should not be singleton because it will have multiple state.
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(
      sl(),
    ),
  );
}
