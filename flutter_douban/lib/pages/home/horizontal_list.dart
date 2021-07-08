import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_douban/pages/http/http_methods.dart';
import 'package:flutter_douban/pages/widgets/movie_item.dart';
import 'package:flutter_douban/routers/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class HorizontalList extends StatelessWidget {
  HorizontalList({this.title: '热门剧集', this.state: 'hot'});
  String title;
  String state;

  Future _getMovies() async {
    if (state == 'hot') {
      return _getHotMovies();
    } else if (state == 'coming') {
      return _getComingMovies();
    }
  }

  Future _getHotMovies() async {
    return await getHotMovies().then((data) {
      return data['rows'];
    });
  }

  Future _getComingMovies() async {
    return await getComingMovies().then((data) {
      return data['rows'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //影院热映查看更多
        Container(
          height: 105.w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              InkWell(
                onTap: () {
                  Application.router.navigateTo(context, '/list');
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      '查看更多',
                      style: TextStyle(
                        color: Color(0xFF41bd55),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFF41bd55),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //电影图片和信息
        Container(
          height: 300.w,
          child: FutureBuilder(
            future: _getMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return MovieItem(item: snapshot.data[index]);
                  },
                );
              } else {
                return Text('加载中...');
              }
            },
          ),
        ),
      ],
    );
  }
}
