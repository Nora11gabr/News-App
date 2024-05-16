import 'package:go_router/go_router.dart';
import 'package:news_app4/features/all_news/data/models/news_model/news_model.dart';
import 'package:news_app4/features/all_news/presentation/views/all_news_view.dart';
import 'package:news_app4/features/all_news/presentation/views/article_details.dart';
import 'package:news_app4/features/splash/Presentation/SplashView.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: '/allnews',
      builder: (context, state) => AllNewsView(),
    ),
    GoRoute(
        path: '/ArticleDetails',
        builder: (context, state) {
          NewsModel extra = state.extra as NewsModel;
          return ArticleDetails(newsModel: extra);
        }),
  ],
);
