import 'package:flutter/material.dart';

class _Styles {
  // HEADER

  TextStyle headerOne({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 34,
      );

  TextStyle headerTwo({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 28,
      );

  TextStyle headerThree({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );

  // BODY LIGHT

  TextStyle lightLarge({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: 18,
      );

  TextStyle lightMedium({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      );

  TextStyle lightSmall({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      );

  TextStyle lightExtraSmall({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: 12,
      );

  // BODY REGULAR

  TextStyle regularLarge({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      );

  TextStyle regularMedium({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );

  TextStyle regularSmall({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  TextStyle regularExtraSmall({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  // BODY MEDIUM

  TextStyle mediumLarge({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );

  TextStyle mediumMedium({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

  TextStyle mediumSmall({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );

  TextStyle mediumExtraSmall({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );

  // BODY SEMIBOLD

  TextStyle semiboldLarge({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  TextStyle semiboldMedium({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  TextStyle semiboldSmall({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );

  TextStyle semiboldExtraSmall({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );

  // BODY BOLD

  TextStyle boldLarge({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  TextStyle boldMedium({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  TextStyle boldSmall({Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );

  TextStyle boldExtraSmall({Color? color = const Color(0xFF000000)}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );
}

final styles = _Styles();
