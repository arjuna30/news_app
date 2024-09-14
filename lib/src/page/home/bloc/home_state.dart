part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadingHomeState extends HomeState {
  @override
  List<Object?> get props => [];
}

class SuccessHomeState extends HomeState {
  final List<NewsDetail> articles;
  final int end;
  SuccessHomeState(this.articles, this.end);

  @override
  List<Object?> get props => [articles, end];
}

class ErrorHomeState extends HomeState {
  final dynamic error;
  ErrorHomeState(this.error);

  @override
  List<Object?> get props => [error];
}
