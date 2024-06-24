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
class NewsUpdateEvent extends NewsEvent{
  String title;
  String body;
  String userId;
  String id;
  NewsUpdateEvent({
    required this.title,
    required this.body,
    required this.userId,
    required this.id,
});
}
class NewsDeleteEvent extends NewsEvent{
  String userId;
  NewsDeleteEvent({
    required this.userId,
  });
}
