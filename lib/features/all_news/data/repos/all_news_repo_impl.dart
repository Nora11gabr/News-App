import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app4/core/api/api.dart';
import 'package:news_app4/core/error/Failures.dart';
import 'package:news_app4/features/all_news/data/models/news_model/news_model.dart';
import 'package:news_app4/features/all_news/data/repos/all_news_repo.dart';

class AllNewsRepoImpl implements AllNewsRepo {
  final ApiService apiService;

  AllNewsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<NewsModel>>> FetchAllNews() async {
    try {
      var data = await apiService.get(endPoint: 'top-headlines?country=us');
      List<NewsModel> articles = [];
      for (var item in data["articles"]) {
        articles.add(NewsModel.fromJson(item));
      }
      return right(articles);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
