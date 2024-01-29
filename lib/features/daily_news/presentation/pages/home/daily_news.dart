import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
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
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(state.articles?[index].urlToImage ?? ""),
            ),
            title: Text(state.articles?[index].title ?? ""),
          ),
          itemCount: state.articles?.length ?? 0,
        );
      }

      return const SizedBox();
    },
  );
}

AppBar _buildAppBar() => AppBar(
      title: const Text(
        "Daily news",
      ),
    );
