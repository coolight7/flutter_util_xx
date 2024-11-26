// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class FlutterParsexx_c {
  static int parseTimeOfDay2Minute(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  static TimeOfDay parseMinute2TimeOfDay(int time) {
    return TimeOfDay(
      hour: time ~/ 60,
      minute: time % 60,
    );
  }

  /// 将字符串转回颜色值
  static Color? parseString2Color(String? str) {
    if (null == str) {
      return null;
    }
    // #AARRGGBB
    // 去掉可能存在的开头 #
    if (str.startsWith('#')) {
      str = str.substring(1);
    }
    // 按16进制解析
    var num = int.tryParse(str, radix: 16);
    if (null != num) {
      // 拼接透明度
      if (num < 0xFFFFFF && str.length <= 6) {
        num += 0xFF000000;
      }
      return Color(num);
    }
    return null;
  }

  /// 将颜色转为字符串
  static String? parseColor2String(Color? color) {
    if (color == null) {
      return null;
    }
    var aa = color.alpha.toRadixString(16);
    if (aa.length == 1) {
      aa = "0$aa";
    }
    var rr = color.red.toRadixString(16);
    if (rr.length == 1) {
      rr = "0$rr";
    }
    var gg = color.green.toRadixString(16);
    if (gg.length == 1) {
      gg = "0$gg";
    }
    var bb = color.blue.toRadixString(16);
    if (bb.length == 1) {
      bb = "0$bb";
    }
    return "#$aa$rr$gg$bb";
  }
}
