import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_source/local/DAO/article_dao.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDAO get articleDAO;
}
