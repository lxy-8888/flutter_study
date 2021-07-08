import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/http/http_methods.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_douban/pages/widgets/movie_item.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int start = 0;
  int count = 12;
  int total = 0;
  List rows = [];
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  Future _getMovies() async {
    getHotMovies(count: count, start: start).then((data) {
      setState(() {
        total = data['total'];
        rows.addAll(data['rows']);
        start = start + count;
      });
      _controller.finishRefresh();
      _controller.finishLoad(noMore: rows.length >= total);
    });
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('影院热映'),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: Container(
        padding: EdgeInsets.all(30.w),
        child: EasyRefresh(
          enableControlFinishLoad: true,
          controller: _controller,
          header: ClassicalHeader(
            refreshedText: '刷新已完成',
            refreshReadyText: '开始刷新',
            refreshingText: '正在刷新',
            textColor: Color(0xFF41bd55),
            infoColor: Colors.grey,
          ),
          footer: ClassicalFooter(
            noMoreText: '没有更多数据',
            loadReadyText: '开始加载',
            loadingText: '正在加载中',
            loadedText: '加载完成',
            textColor: Color(0xFF41bd55),
            infoColor: Colors.grey,
          ),
          onLoad: () async {
            _getMovies();
          },
          onRefresh: () async {
            setState(() {
              start = 0;
              rows = [];
            });
            _getMovies();
          },
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 40.w,
                mainAxisSpacing: 40.w,
                childAspectRatio: 0.7),
            itemBuilder: (context, index) {
              return MovieItem(
                item: rows[index],
              );
            },
            itemCount: rows.length,
          ),
        ),
      ),
    );
  }
}
