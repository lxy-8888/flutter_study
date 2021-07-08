import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_douban/pages/detail/detail_page.dart';
import 'package:flutter_douban/pages/home/home_page.dart';
import 'package:flutter_douban/pages/list/list_page.dart';
import 'package:flutter_douban/pages/login/login_page.dart';
import 'package:flutter_douban/pages/tab_bottom.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabBottom();
});
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Homepage();
});
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Login();
});
var listHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ListPage();
});
var detailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //print('params:${params['movieId']?.first}');

  String movieId = params['movieId']?.first; //拿到ID
  String movieTitle = params['movieTitle']?.first;
  return DetailPage(movieId: movieId, movieTitle: movieTitle); //传到详情页
});
