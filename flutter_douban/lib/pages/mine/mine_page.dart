import 'package:flutter/material.dart';
import 'package:flutter_douban/routers/application.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: RaisedButton(
        onPressed: () {
          Application.router.navigateTo(context, '/login');
        },
      ),
    );
  }
}
