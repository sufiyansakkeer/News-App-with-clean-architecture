import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/article_details_page/article_details_page.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/savedArticle/saved_articles.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/widgets/article_widget.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }

        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () => _onArticlePressed(
                context,
                state.articles![index],
              ),
              child: ArticleWidget(
                article: state.articles![index],
              ),
            ),
            itemCount: state.articles?.length ?? 0,
          );
        }

        return const SizedBox();
      },
    );
  }

// Appbar
  AppBar _buildAppBar(BuildContext context) => AppBar(
        title: const Text(
          "Daily news",
        ),
        actions: [
          GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark, color: Colors.black),
            ),
          ),
        ],
      );

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticleDetailsView(
          article: article,
        ),
      ),
    );
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SavedArticles(),
    ));
  }
}

// Body
