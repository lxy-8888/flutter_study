import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/routers/application.dart';
import 'package:flutter_douban/routers/route_handlers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  String _username = '';
  String _password = '';
  //标题
  Widget _loginTitle() {
    return Text(
      '豆瓣账号密码登录',
      style: TextStyle(
        fontSize: 60.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  //输入框
  Widget _inputBox() {
    return Container(
      height: 177.w,
      margin: EdgeInsets.fromLTRB(40.w, 100.w, 40.w, 40.w),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: Color(0xFFCCCCCC)),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextField(
                focusNode: _usernameFocus,
                decoration: InputDecoration(
                    //  border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.w,
                        color: Color(0xFFcccccc),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.w,
                        color: Color(0xFFcccccc),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 20.w),
                    hintText: '手机号/邮箱'),
                onChanged: (String val) {
                  _username = val;
                }),
            //  )
          ),
          Expanded(
            child: TextField(
              focusNode: _passwordFocus,
              decoration: InputDecoration(
                  //  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.w,
                      color: Color(0xFFcccccc),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.w,
                      color: Color(0xFFcccccc),
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 20.w),
                  hintText: '请输入密码'),
              onChanged: (String val) {
                _password = val;
              },
            ),
          ),
        ],
      ),
    );
  }

  //按钮
  Widget _loginBtn(context) {
    return Container(
      margin: EdgeInsets.only(left: 40.w, right: 40.w),
      width: 670.w,
      height: 90.w,
      child: RaisedButton(
        color: Color(0xFF41bd55),
        child: Text(
          '登录',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          Response response = await Dio().post(
            'http://192.168.0.114:3000/users/login',
            data: {'username': _username, 'password': _password},
          );
          print(response.data);
          if (response.data.length > 0) {
            Application.router.navigateTo(context, '/', replace: true);
          } else {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('提示'),
                  content: Text('登录失败'),
                );
              },
            );
          }
        },
      ),
    );
  }

  //其他登录方式
  Widget _otherLogin() {
    return Container(
      padding: EdgeInsets.only(left: 40.w, right: 40.w),
      margin: EdgeInsets.only(top: 65.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '短信验证登录/注册',
            style: TextStyle(fontSize: 20.w, color: Color(0xFF41bd55)),
          ),
          Text(
            '海外手机密码登录',
            style: TextStyle(fontSize: 20.w, color: Color(0xFF41bd55)),
          ),
        ],
      ),
    );
  }

  //忘记密码
  Widget _forgotPassword() {
    return Padding(
      padding: EdgeInsets.only(bottom: 90.w),
      child: Text('忘记密码？找回密码'),
    );
  }

  //焦点
  var _usernameFocus = FocusNode();
  var _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          _usernameFocus.unfocus();
          _passwordFocus.unfocus();
        },
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                //占位
                Container(
                  height: 200.h,
                ),
                //标题
                _loginTitle(),
                //输入框
                _inputBox(),
                //按钮
                _loginBtn(context),
                //其他登录
                _otherLogin(),
                //占位
                Container(
                  height: 150.h,
                ),
                //忘记密码
                _forgotPassword(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
