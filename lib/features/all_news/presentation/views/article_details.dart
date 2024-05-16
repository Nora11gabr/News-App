import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app4/core/utils/app_color.dart';
import 'package:news_app4/core/utils/app_textstyle.dart';
import 'package:news_app4/features/all_news/data/models/news_model/news_model.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: Text(
            'Article Details',
            style: AppTextstyle.Primery600Size22,
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(newsModel.urlToImage),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsModel.title!,
                style: AppTextstyle.Primery600Size22,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsModel.content,
                style: AppTextstyle.Black600Size15,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Source : ${newsModel.source!.name!}',
                style:
                    AppTextstyle.Black600Size15.copyWith(color: AppColor.Red),
              ),
            ),
          ],
        ));
  }
}
