//Your API key is: 3e97c94077024c528b31195a04889935
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static late Dio dioNews;
  static late Dio dioShop;

  static dioInit() {
    dioNews = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));

    dioShop = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> logIn(String url, Map<String, dynamic> query) async {
    dioShop.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json'
    };
    return await dioShop.post(url, queryParameters: query);
  }

  static Future<Response> getHomeShop(
      {required String url,
      String? token,
      String? lang,
      Map<String, dynamic>? query}) async {
    dioShop.options.headers = {
      'Authorization': token,
      'lang': lang,
      'Content-Type': 'application/json'
    };
    return await dioShop.get(url, queryParameters: query);
  }

  static Future<Response> getSearchData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dioNews.get(url, queryParameters: query);
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    try {
      dioNews.post('', data: {});
      return await dioNews.get(url, queryParameters: query);
    } catch (err) {
      throw err.toString();
    }
  }
}
