// ignore_for_file: camel_case_types

export 'parse.dart';

import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class FlutterUtilxx_c {
  /// 计算Text组件的宽高
  static Size countTextWidgetSize(
    String text,
    TextStyle style, {
    int maxLines = 2 ^ 31,
    double maxWidth = double.infinity,
  }) {
    if (text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: maxLines,
    )..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  static Color shiftColor(Color color, int shift) {
    return Color.fromRGBO(
      math.max(color.red + shift, 0),
      math.max(color.green + shift, 0),
      math.max(color.blue + shift, 0),
      1,
    );
  }

  /// 让[useColor]和[fromColor]保持 [sub]以上 的距离
  static Color awaySetColor(
    Color? useColor,
    Color fromColor,
    int sub, {
    bool toUpper = true,
  }) {
    if (null == useColor) {
      return shiftColor(fromColor, sub);
    }
    int subPoint(int usePoint, int fromPoint, int limit) {
      final sub = usePoint - fromPoint;
      if (limit < 0) {
        limit = -limit;
      }
      if (sub <= limit && sub >= -limit) {
        if (toUpper) {
          return math.min((math.max(usePoint, fromPoint) + limit), 255);
        } else {
          return math.max((math.min(usePoint, fromPoint) - limit), 0);
        }
      }
      return usePoint;
    }

    return Color.fromRGBO(
      subPoint(useColor.red, fromColor.red, sub),
      subPoint(useColor.green, fromColor.green, sub),
      subPoint(useColor.blue, fromColor.blue, sub),
      1,
    );
  }

  /// 让[useColor]和[fromColor]保持 [sub] 以内 的距离
  static Color nearSetColor(
    Color? useColor,
    Color fromColor,
    int sub,
  ) {
    if (null == useColor) {
      return fromColor;
    }
    int subPoint(int usePoint, int fromPoint, int limit) {
      final sub = usePoint - fromPoint;
      if (limit < 0) {
        limit = -limit;
      }
      if (sub <= limit && sub >= -limit) {
        return usePoint;
      }
      final rePoint = fromPoint + ((sub > 0) ? limit : -limit);
      if (rePoint < 0) {
        return 0;
      } else if (rePoint > 255) {
        return 255;
      } else {
        return rePoint;
      }
    }

    return Color.fromRGBO(
      subPoint(useColor.red, fromColor.red, sub),
      subPoint(useColor.green, fromColor.green, sub),
      subPoint(useColor.blue, fromColor.blue, sub),
      1,
    );
  }
}
