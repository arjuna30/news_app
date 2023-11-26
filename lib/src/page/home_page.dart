import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/src/bloc/home_bloc/home_bloc.dart';
import 'package:news_app/src/component/app_router.gr.dart';
import 'package:news_app/src/model/article.dart';
import 'package:news_app/src/page/extra/error_content.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static final route = AutoRoute(page: HomeRoute.page, initial: true);
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: HomeBloc.create,
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is LoadingHomeState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ErrorHomeState) {
              return ErrorContent(
                onPressed: () =>
                    ReadContext(context).read<HomeBloc>().add(FetchHomeEvent()),
              );
            }
            if (state is SuccessHomeState) {
              final articles = state.articles;
              final end = state.end;
              return _BodyHomePage(articles: articles, end: end);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    ReadContext(context).read<HomeBloc>().close();
    super.dispose();
  }
}

class _BodyHomePage extends StatefulWidget {
  final List<Article> articles;
  final int end;
  const _BodyHomePage({Key? key, required this.articles, required this.end})
      : super(key: key);

  @override
  State<_BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<_BodyHomePage> {
  final _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoading: _loadMore,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          itemCount: widget.articles.length,
          itemBuilder: (context, index) {
            final article = widget.articles[index];
            return Column(
              children: [
                _ArticleCard(article: article),
                const Divider(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onRefresh() {
    ReadContext(context).read<HomeBloc>().add(FetchHomeEvent());
    _refreshController.refreshCompleted();
  }

  void _loadMore() {
    ReadContext(context).read<HomeBloc>().add(LoadMoreHomeEvent(widget.end));
    _refreshController.loadComplete();
  }
}

class _ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback? onTap;

  const _ArticleCard({
    Key? key,
    required this.article,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMMd().format(article.createdAt);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailArticleRoute(article: article));
      },
      child: Container(
        height: 230,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.contentThumbnail,
                height: 150, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(date, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
