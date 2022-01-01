import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/src/model/article.dart';
import 'package:news_app/src/repository/news_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewsRepository _newsRepository;
  late List<Article> _baseArticles;

  static HomeBloc create(BuildContext context) =>
      HomeBloc._(Modular.get())..add(FetchHomeEvent());

  HomeBloc._(this._newsRepository) : super(HomeInitial()) {
    on<FetchHomeEvent>(_fetchArticles);
    on<LoadMoreHomeEvent>(_loadMoreArticle);
  }

  Future<void> _fetchArticles(FetchHomeEvent event, Emitter emit) async {
    try {
      emit(LoadingHomeState());
      const end = 5;
      _baseArticles = await _newsRepository.getArticles();
      final articles = _baseArticles.sublist(0, end);
      emit(SuccessHomeState(articles, end));
    } catch (e) {
      emit(ErrorHomeState(e));
    }
  }

  Future<void> _loadMoreArticle(LoadMoreHomeEvent event, Emitter emit) async {
    final end = event.end + 5;
    if (end > _baseArticles.length) {
      emit(SuccessHomeState(_baseArticles, _baseArticles.length - 1));
      return;
    }
    final newArticles = _baseArticles.sublist(0, end);
    emit(SuccessHomeState(newArticles, end));
  }
}
