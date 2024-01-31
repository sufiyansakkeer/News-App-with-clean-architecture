import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/config/theme/app_theme.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_clean_architecture/injection_container.dart';

/// `presentation`: This layer contains the UI components and is responsible for
/// displaying data to the user and capturing user input. It includes widgets,
/// pages, and other UI-related code. UI components should interact with
/// `BLoCs`(or any other `state management`) to retrieve and display data. BLoCs, in
/// turn, interact with the domain layer to perform business logic.

/// `domain`: The domain layer contains the business logic and use cases of the
/// application. It is independent of any external frameworks and should only
/// depend on the core Dart libraries.

/// `data`: This layer is responsible for interacting with external data sources
/// such as databases, APIs, or repositories. It implements the interfaces
/// defined in the domain layer.

/// `core`: The core layer includes common utilities, helper functions, and shared
/// code that is used across multiple layers.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// To initialize dependency injection
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemoteArticleBloc(sl())..add(const GetArticle()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        themeMode: MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        home: const DailyNews(),
      ),
    );
  }
}
