import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app4/core/api/api.dart';
import 'package:news_app4/core/utils/app_color.dart';
import 'package:news_app4/core/utils/app_textstyle.dart';
import 'package:news_app4/core/utils/service_locator.dart';
import 'package:news_app4/core/widgets/custom_error_widget.dart';
import 'package:news_app4/core/widgets/custom_loaading_widget.dart';
import 'package:news_app4/features/all_news/presentation/manager/cubit/all_news_cubit.dart';
import 'package:news_app4/features/all_news/presentation/views/widgets/articles_listview.dart';
import 'package:news_app4/features/all_news/presentation/views/widgets/news_card.dart';

import '../../data/repos/all_news_repo_impl.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.newspaper_sharp,
              color: AppColor.Red,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'All News ',
              style: AppTextstyle.Primery600Size22,
            )
          ],
        ),
      ),
      body: ArticlesListview(),
    );
  }
}
