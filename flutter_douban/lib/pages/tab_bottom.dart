import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/home/home_page.dart';
import 'package:flutter_douban/pages/mine/mine_page.dart';
import 'package:flutter_douban/pages/top/top_page.dart';

class TabBottom extends StatefulWidget {
  @override
  _TabBottomState createState() => _TabBottomState();
}

class _TabBottomState extends State<TabBottom> {
  List pageData = [Homepage(), TopPage(), MinePage()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('榜单')),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_add), title: Text('我的'))
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pageData[currentIndex],
    );
  }
}
