import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/theming/colors.dart';
import 'package:medisync/core/theming/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextStyle? style;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final String hintText;
  final TextStyle? hintTextStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextEditingController? controller;
  final Function(String?) validator;

  const CustomTextField({
    super.key,
    this.style,
    this.isObscureText,
    this.suffixIcon,
    this.hintTextStyle,
    this.backgroundColor,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      style: style ?? TextStyles.font14DarkBlueMeduim,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintTextStyle ?? TextStyles.font14LightGrayMeduim,
        fillColor: backgroundColor ?? ColorsManager.moreLightGray,
        filled: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: ColorsManager.mainBlue, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: ColorsManager.lighterGray),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
