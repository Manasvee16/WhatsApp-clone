// ignore_for_file: must_be_immutable

part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class NewsInitialFetchEvent extends NewsEvent{}
class NewsAddEvent extends NewsEvent{
  String title;
  String body;
  String userId;
  NewsAddEvent({
    required this.title,
    required this.body,
    required this.userId,
});
}
