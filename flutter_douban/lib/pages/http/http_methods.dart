import 'package:dio/dio.dart';
import 'package:flutter_douban/pages/http/http_url.dart';

Future getHotMovies({start = 0, count = 8}) async {
  Response response = await Dio().get(
    httpPath['gHotMovies'],
    queryParameters: {'start': start, 'count': count},
  );
  return response.data;
}

Future getComingMovies() async {
  Response response = await Dio().get(httpPath['gComingMovies']);
  return response.data;
}
