import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app4/core/api/api.dart';
import 'package:news_app4/features/all_news/data/repos/all_news_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<AllNewsRepoImpl>(
    AllNewsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
