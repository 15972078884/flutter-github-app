import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DiffScaleText extends StatefulWidget {
//   final String? text;
//   final TextStyle? textStyle;
//
//   const DiffScaleText({super.key, required this.text, this.textStyle});
//
//   @override
//   State<DiffScaleText> createState() => _DiffScaleTextState();
// }
//
// class _DiffScaleTextState extends State<DiffScaleText>
//     with TickerProviderStateMixin {
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 400))
//       ..addStatusListener((status) {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TextStyle? textStyle =
//         widget.textStyle ?? TextStyle(fontSize: 20.sp, color: XFColors.white);
//
//     return AnimatedBuilder(
//         animation: _animationController, builder: (context, child) {
//       return RepaintBoundary(
//         child: CustomPaint(
//           foregroundPainter:,
//           child: Text(
//             widget.text ?? '',
//             style: textStyle,
//           ),
//         ),
//       );
//     });
//   }
// }
//
// class _DiffText extends CustomPainter {
//
//   final String? text;
//   final TextStyle? textStyle;
//   final double progress;
//   String? _oldText;
//   List<_TextLayoutInfo> _textLayoutInfo = [];
//   List<_TextLayoutInfo> _oldTextLayoutInfo = [];
//
//   _DiffText(
//       {super.repaint, required this.text, required this.textStyle, this.progress = 1});
//
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     double percent = max(0, min(1, progress));
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//   }
//
// }
//
// class _TextLayoutInfo {
//   String? text;
//   double? offsetX;
//   late double offsetY;
//   double? baseline;
//   double? width;
//   late double height;
//   double? fromX = 0;
//   double? toX = 0;
//   bool needMove = false;
// }
