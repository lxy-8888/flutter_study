import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/home/horizontal_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Homepage extends StatelessWidget {
  Widget _getsearchBar() {
    return Container(
      padding: EdgeInsets.all(16.w),
      height: 88.w,
      color: Color(0xFF41bd55),
      child: Container(
        height: 56.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: Colors.white,
        ),
      ),
    );
  }

  List<String> _swiperData = [
    "http://img5.mtime.cn/mg/2020/12/04/093256.18276378.jpg",
    "http://img5.mtime.cn/mg/2020/12/04/120844.47877597.jpg",
    "http://img5.mtime.cn/mg/2020/12/03/100910.59968670.jpg",
    "http://img5.mtime.cn/mg/2020/12/02/083829.47795350.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '首页',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        brightness: Brightness.dark,
      ),
      body: ListView(
        children: <Widget>[
          //搜索框
          _getsearchBar(),
          //轮播
          Container(
            height: 300.w,
            child: Swiper(
              itemCount: _swiperData.length,
              itemBuilder: (context, index) {
                return Image.network(
                  _swiperData[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              pagination: SwiperPagination(),
            ),
          ),
          //打包row
          HorizontalList(
            title: '豆瓣热门',
            state: 'hot',
          ),
          //影院热映查看更多可重复位置
          HorizontalList(title: '影院热映', state: 'coming'),
          //重复row
          HorizontalList(title: '即将上映', state: 'hot'),
          //重复肉
          HorizontalList(
            title: '热门剧集',
            state: 'coming',
          ),
        ],
      ),
    );
  }
}
