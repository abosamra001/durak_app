import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool? enabled;
  final TextDirection? textDirection;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.enabled,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: validator,
      textDirection: textDirection,
      decoration: InputDecoration(
        label: Text(label),
        hint: Text(hint),
        filled: true,
        fillColor: context.themeData.cardColor,
        border: OutlineInputBorder(
          borderSide: .none,
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.themeData.colorScheme.primary),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      keyboardType: keyboardType,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: onChanged,
    );
  }
}
