import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final deviceSize = (BuildContext context) => MediaQuery.of(context).size;

const mFontFamily = '';

// Colors
const Color memoBackgroundColor = const Color(0xFFF5F5F5);
const Color memoDarkTextColor = const Color(0xFF222B45);
const Color memoLightTextColor = const Color(0xFF8F9BB3);
const Color memoInactiveColor = const Color(0xFFEDF1F7);
const Color memoShadowColor = const Color(0x15333333);
const Color memoBorderColor = const Color(0xFFCDCDCD);

const Color memoBrown = const Color(0xFFBCAAA4);
const Color memoWhite = const Color(0xFFFFFFFF);
const Color memoHint = const Color(0xDDFFFFFF);
const Color memoRed = const Color(0xFFEF9A9A);
const Color memoPink = const Color(0xFFFEB7B1);
const Color memoOrange = const Color(0xFFFFCC80);
const Color memoGreen = const Color(0xFFAFDC87);
const Color memoTeal = const Color(0xFFB2DFDB);
const Color memoCyan = const Color(0xFFB2EBF2);
const Color memoBlue = const Color(0xFFC7CEEA);
const Color memoPurple = const Color(0xFFA3B5FD);
const Color memoBone = const Color(0xFFF5F5F5);

final memoFormatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0,);