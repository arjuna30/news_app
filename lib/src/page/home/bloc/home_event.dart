part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchHomeEvent extends HomeEvent {}

class LoadMoreHomeEvent extends HomeEvent {
  final int end;

  LoadMoreHomeEvent(this.end);
}
