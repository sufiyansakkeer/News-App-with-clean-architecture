import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/article_details_page/article_details_page.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/savedArticle/saved_articles.dart';

import '../../features/daily_news/domain/entities/article.dart';
import '../../features/daily_news/presentation/pages/home/daily_news.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
