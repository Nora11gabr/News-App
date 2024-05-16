part of 'all_news_cubit.dart';

sealed class AllNewsState extends Equatable {
  const AllNewsState();

  @override
  List<Object> get props => [];
}

final class AllNewsInitial extends AllNewsState {}

final class AllNewsSuccess extends AllNewsState {
  final List<NewsModel> allNews;

  AllNewsSuccess(this.allNews);
}

final class AllNewsFailure extends AllNewsState {
  final String errorMsg;

  AllNewsFailure(this.errorMsg);
}

final class AllNewsloading extends AllNewsState {}
