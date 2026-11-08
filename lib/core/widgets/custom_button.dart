import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? borderRadius;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor ?? context.themeData.scaffoldBackgroundColor,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 34.w, vertical: 16.h),
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(borderRadius ?? 24.r),
      ),
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      child: child,
    );
  }
}
