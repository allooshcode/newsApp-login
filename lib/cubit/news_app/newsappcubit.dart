import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/news_app/newsappstetes.dart';
import 'package:newsapp/network/remote/diohelper.dart';

class NewsAppCubit extends Cubit<NewsStates> {
  NewsAppCubit() : super(InitStateApp());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoading());

    DioHelper.getData(url: '/v2/top-headlines', query: {
      'apiKey': '3e97c94077024c528b31195a04889935',
      'country': 'eg',
      'category': 'health'
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessState());
      print(value.data);
      print(business[0]['urlToImage']);
    });
  }

  List<dynamic> searchResults = [];

  void search(String value) {
    searchResults = [];

    emit(NewsGetSearchesStateLoading());
    DioHelper.getSearchData(url: '/v2/everything', query: {
      'apiKey': '3e97c94077024c528b31195a04889935',
      'qInTitle': value,
    }).then((value) {
      searchResults = value.data['articles'];
      emit(NewsGetSearchesState());
    }).catchError((onError) {
      emit(NewsGetSearchesStateError());
    });
  }

  int x = 88;
}
