// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_new_design/news_api/news_data_ui_model.dart';
import 'package:whatsapp_new_design/news_api/news_repo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsInitialFetchEvent>(newsInitialFetchEvent);
    on<NewsAddEvent>(newsAddEvent);
    on<NewsUpdateEvent>(newsUpdateEvent);
    on<NewsDeleteEvent>(newsDeleteEvent);
  }
  FutureOr<void> newsInitialFetchEvent(NewsInitialFetchEvent event, Emitter<NewsState> emit) async {
    emit(NewsFetchingLoadingState());
    List<NewsDataUiModel> news=await NewsRepo.fetchNews();
    emit(NewsFetchingSuccessfulState(news: news));
  }
  FutureOr<void> newsAddEvent(NewsAddEvent event, Emitter <NewsState> emit) async {
    bool success=await NewsRepo.addNews(event.title, event.body, event.userId);
    print('response');
    print(success);
    if (success) {
      emit(NewsAdditionSuccessState());
    }
    else{
      emit(NewsAdditionErrorState());
    }
  }
  FutureOr<void> newsUpdateEvent(NewsUpdateEvent event, Emitter <NewsState> emit) async {
    bool success=await NewsRepo.updateNews(event.title, event.body, event.userId, event.id);
    print('response');
    print(success);
    if (success) {
      emit(NewsUpdationSuccessState());
    }
    else{
      emit(NewsUpdationErrorState());
    }
  }
  FutureOr<void> newsDeleteEvent(NewsDeleteEvent event, Emitter <NewsState> emit) async {
    bool success=await NewsRepo.deleteNews(event.userId);
    print('response');
    print(success);
    if (success) {
      emit(NewsDeletionSuccessState());
    }
    else{
      emit(NewsDeletionErrorState());
    }
  }
}
