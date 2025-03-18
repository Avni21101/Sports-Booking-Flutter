import 'package:flutter/material.dart';
import 'package:sports_booking/app_ui/utils.dart';
import 'package:sports_booking/app_ui/widgets/border_radius.dart';
import 'package:sports_booking/app_ui/widgets/padding.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.errorText,
    required this.hintText,
    required this.isPasswordField,
    this.isObscureText,
    this.onChange,
    this.keyboardType,
  });

  final String? errorText;
  final String hintText;
  final bool isPasswordField;
  final bool? isObscureText;
  final void Function(String text)? onChange;
  final TextInputType? keyboardType;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool shouldShowPassword;

  @override
  void initState() {
    super.initState();
    shouldShowPassword = widget.isObscureText ?? false;
  }

  void toggleObscureText() {
    setState(() {
      shouldShowPassword = !shouldShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: Insets.xsmall8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.small8),
        ),
        errorText: widget.errorText,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: context.colorScheme.grey,
        ),
        suffixIcon:
            widget.isPasswordField
                ? IconButton(
                  onPressed: toggleObscureText,
                  icon: Icon(
                    shouldShowPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    // color: context.colorScheme.grey700,
                  ),
                )
                : null,
      ),
    );
  }
}
