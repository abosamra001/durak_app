import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool? enabled;
  final int? maxLines;
  final int? maxLength;
  final Color? fillColor;
  final InputBorder? border;
  final TextDirection? textDirection;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<PointerDownEvent>? onPressOutside;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.border,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.enabled,
    this.textDirection,
    this.fillColor,
    this.maxLines,
    this.maxLength,
    this.onPressOutside,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: validator,
      textDirection: textDirection,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        label: Text(label),
        hint: Text(hint),
        filled: true,
        fillColor: fillColor ?? context.themeData.colorScheme.onPrimary,
        enabledBorder: border,
        border:
            border ??
            OutlineInputBorder(
              borderSide: .none,
              borderRadius: BorderRadius.circular(16.r),
            ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.themeData.colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      keyboardType: keyboardType,
      onTapOutside: (event) {
        onPressOutside?.call(event);
        FocusScope.of(context).unfocus();
      },
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
