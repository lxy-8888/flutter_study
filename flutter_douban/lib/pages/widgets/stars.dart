import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Stars extends StatelessWidget {
  final String stars;
  Stars({this.stars});

  List _getStarsIcon() {
    List<Widget> starIcons = [];
    for (int i = 0; i < int.parse(stars[0]); i++) {
      starIcons.add(Icon(Icons.star, color: Colors.orange, size: 22.w));
    }
    if (stars[1] == '5') {
      starIcons.add(Icon(Icons.star_half, color: Colors.orange, size: 22.w));
    }
    for (int i = starIcons.length; i < 5; i++) {
      starIcons.add(Icon(Icons.star_border, color: Colors.orange, size: 22.w));
    }
    return starIcons;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: _getStarsIcon());
  }
}
