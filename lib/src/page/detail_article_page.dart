import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/src/component/app_router.gr.dart';
import 'package:news_app/src/model/article.dart';

@RoutePage()
class DetailArticlePage extends StatelessWidget {
  static final route = AutoRoute(
    page: DetailArticleRoute.page,
    // path: '/article/:id',
  );
  const DetailArticlePage({
    Key? key,
    required this.article,
    // @PathParam.inherit('id') required String id,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _BodyDetailArticlePage(article));
  }
}

class _BodyDetailArticlePage extends StatelessWidget {
  final Article article;
  const _BodyDetailArticlePage(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMMEEEEd().format(article.createdAt);
    final slideShow = article.slideshow;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.title,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            Text('By ${article.contributorName}'),
            Text(date,
                style:
                    const TextStyle(height: 1.5, fontStyle: FontStyle.italic)),
            (slideShow.isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                          height: 300,
                          viewportFraction: 1,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3)),
                      itemCount: slideShow.length,
                      itemBuilder: (context, itemIndex, pageViewIndex) {
                        return Image.network(slideShow[itemIndex],
                            fit: BoxFit.cover);
                      },
                    ),
                  )
                : Container(
                    height: 300,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    child:
                        Center(child: Image.network(article.contentThumbnail)),
                  ),
            Text(
              article.content,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
