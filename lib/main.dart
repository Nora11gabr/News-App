import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app4/core/router/app_router.dart';
import 'package:news_app4/core/utils/service_locator.dart';
import 'package:news_app4/features/all_news/data/repos/all_news_repo_impl.dart';
import 'package:news_app4/features/all_news/presentation/manager/cubit/all_news_cubit.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllNewsCubit(
            getIt.get<AllNewsRepoImpl>(),
          )..FetchAllNews(),
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
        designSize: const Size(360, 690),
      ),
    );
  }
}
