import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/widgets/stars.dart';
import 'package:flutter_douban/routers/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItem extends StatelessWidget {
  MovieItem({this.item});
  Map item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router
            .navigateTo(context, '/detail/${item['_id']}/${item['title']}');
      },
      child: Container(
        width: 160.w,
        height: 300.w,
        //  color: Colors.black26,
        margin: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //图片控制
            SizedBox(
              width: 160.w,
              height: 224.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: Image.network(item['movieImg'], fit: BoxFit.fill),
              ),
            ),
            Text(
              item['title'],
              style: TextStyle(fontSize: 26.sp),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stars(stars: item['stars']),
                Text(
                  item['average'],
                  style: TextStyle(fontSize: 24.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
