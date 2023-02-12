import 'package:newsapi/Networks/Model/NewsModel.dart';

abstract class NewState {}

class InitialState extends NewState {}

class LoadingState extends NewState {}

class NewsLoadedState extends NewState {
  final NewsModel model;
  NewsLoadedState(this.model);
}
class ErrorState extends NewState {
  final String error;

  ErrorState(this.error);
}
