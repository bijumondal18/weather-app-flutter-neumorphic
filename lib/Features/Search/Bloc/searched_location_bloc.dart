import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starter_project/Features/Search/Repository/searched_location_repository.dart';

import '../Model/search_model.dart';

part 'searched_location_event.dart';

part 'searched_location_state.dart';

class SearchedLocationBloc
    extends Bloc<SearchedLocationEvent, SearchedLocationState> {
  SearchedLocationBloc() : super(SearchedLocationStateInitial()) {
    final SearchedLocationRepository repository = SearchedLocationRepository();

    on<GetSearchedLocationEvent>((event, emit) async {
      try {
        emit(SearchedLocationStateLoading());
        final mData = await repository.fetchSearchedLocation('&q=${event.query}');
        log('------mData : $mData');
        //Future.delayed(const Duration(milliseconds: 2000));
        emit(SearchedLocationStateLoaded(mData as List<SearchModel>));
      } catch (e) {
        emit(SearchedLocationStateError(e.toString()));
      }
    });
  }
}
