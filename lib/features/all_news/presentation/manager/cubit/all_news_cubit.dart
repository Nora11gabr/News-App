import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app4/features/all_news/data/models/news_model/news_model.dart';
import 'package:news_app4/features/all_news/data/repos/all_news_repo.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit(this.allNewsRepo) : super(AllNewsInitial());
  final AllNewsRepo allNewsRepo;
  Future<void> FetchAllNews() async {
    emit(AllNewsloading());
    var result = await allNewsRepo.FetchAllNews();
    result.fold(
      (Failure) {
        emit(AllNewsFailure(Failure.errMsg));
      },
      (articles) => {
        emit(
          AllNewsSuccess(articles),
        )
      },
    );
  }
}
