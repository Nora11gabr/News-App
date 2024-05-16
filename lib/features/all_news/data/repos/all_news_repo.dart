import 'package:dartz/dartz.dart';
import 'package:news_app4/core/error/Failures.dart';
import 'package:news_app4/features/all_news/data/models/news_model/news_model.dart';

abstract class AllNewsRepo {
  Future<Either<Failure, List<NewsModel>>> FetchAllNews();
}
