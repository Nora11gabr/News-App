import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app4/core/widgets/custom_error_widget.dart';
import 'package:news_app4/features/all_news/presentation/manager/cubit/all_news_cubit.dart';
import 'package:news_app4/features/all_news/presentation/views/widgets/news_card.dart';

import '../../../../../core/widgets/custom_loaading_widget.dart';

class ArticlesListview extends StatelessWidget {
  const ArticlesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AllNewsCubit, AllNewsState>(
        builder: (context, state) {
          if (state is AllNewsSuccess) {
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push('/ArticleDetails', extra: state.allNews[index]);
                  },
                  child: NewsCard(
                      title: state.allNews[index].title!,
                      time: state.allNews[index].publishedAt!,
                      img: state.allNews[index].urlToImage ??
                          'https://logowik.com/content/uploads/images/1-news6242.jpg'),
                );
              },
            );
          } else if (state is AllNewsFailure) {
            return CustomErrorWidget(ErrorMessage: state.errorMsg);
          } else {
            return CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
