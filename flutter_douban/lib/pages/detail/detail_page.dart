import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  String movieId;
  String movieTitle;
  DetailPage({this.movieId: '', this.movieTitle: ''}) : super();
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  //头部
  Widget _detailHeader(Map movie) {
    return Container(
      padding: EdgeInsets.only(top: 10.w, bottom: 40.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 200.w,
            height: 280.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.w),
              child: Image.network(movie['movieImg'], fit: BoxFit.fill),
            ),
          ),
          //文字
          Container(
            width: 450.w,
            margin: EdgeInsets.only(left: 35.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie['title'],
                  style: TextStyle(
                    fontSize: 44.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//发送请求获取电影详情
  Future _getDetailById() async {
    Response response = await Dio().get(
        'http://192.168.0.114:3000/movies/detail',
        queryParameters: {'_id': widget.movieId});
    return response.data;
    // print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFf3f4f8),
        appBar: AppBar(
          title: Text(widget.movieTitle),
        ),
        body: FutureBuilder(
          future: _getDetailById(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.all(30.w),
                child: ListView(
                  children: <Widget>[_detailHeader(snapshot.data.first)],
                ),
              );
            } else {
              return Text('正在加载中...');
            }
          },
        ),
      ),
    );
  }
}
