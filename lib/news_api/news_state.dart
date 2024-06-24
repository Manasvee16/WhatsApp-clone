part of'news_bloc.dart';

@immutable
abstract class NewsState {}
abstract class NewsActionState extends NewsState {}
class NewsInitial extends NewsState {}
class NewsFetchingLoadingState extends NewsState {}
class NewsFetchingErrorState extends NewsState {}
class NewsFetchingSuccessfulState extends NewsState{
  final List<NewsDataUiModel> news;
  NewsFetchingSuccessfulState({
    required this.news,
  });
}
class NewsAdditionSuccessState extends NewsActionState {}
class NewsAdditionErrorState extends NewsActionState {}
class FailureNewsState extends NewsState {
  final String error;

  FailureNewsState(this.error);
}
class LoadingNewsState extends NewsState {}
class NewsSavedActionState extends NewsActionState{}
class NewNewsNavigateToScreenActionState extends NewsActionState{}
class UpdateNewsNavigateToScreenActionState extends NewsActionState{}
class NewsUpdatedActionState extends NewsActionState{}
class NewsDeletionSuccessState extends NewsActionState {}
class NewsDeletionErrorState extends NewsActionState {}
class NewsUpdationSuccessState extends NewsActionState {}
class NewsUpdationErrorState extends NewsActionState {}
