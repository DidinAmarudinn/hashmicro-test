
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_colors.dart';

import '../ui_constants/app_fonts.dart';
import '../ui_constants/app_size.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield(
      {super.key,
      this.obscure = false,
      this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixText,
      this.placeholder,
      this.maxLines,
      this.minLines = 1,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.errorText,
      this.error = false,
      this.controller,
      this.borderColor = AppColors.borderColor,
      this.borderRadius = AppSize.radius,
      this.backgroundColor = Colors.white,
      this.padding,
      this.placeholderStyle,
      this.validator,
      this.textInputAction,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.isDense = false,
      this.autofocus = false,
      this.elevation = 0.0,
      this.enabled = true,
      this.maxLength,
      this.onTap,
      this.isOption = false,
      this.textAlign,
      this.isWithShadow = false,
      this.textCapitalization,
      this.focusNode,
      this.value,
      this.readOnly});
  final String? value;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final bool obscure;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isWithShadow;
  final String? suffixText;
  final String? placeholder;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final TextInputType keyboardType;
  final String? errorText;
  final bool error;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final TextStyle? placeholderStyle;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final bool isDense;
  final double elevation;
  final VoidCallback? onTap;
  final bool isOption;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            children: [
              Text(
                label!,
                style: AppFonts.primaryRegularTextStyle
                    .copyWith(letterSpacing: 0.2),
              ),
              const SizedBox(
                height: AppSize.spaceSmall,
              ),
            ],
          ),
        Material(
          elevation: elevation,
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Theme(
            data: ThemeData(primaryColor: AppColors.primaryColor),
            child: TextFormField(
              readOnly: isOption,
              focusNode: focusNode,
              enabled: enabled,
              showCursor: !isOption,
              enableInteractiveSelection: !isOption,
              onFieldSubmitted: onFieldSubmitted,
              textInputAction: textInputAction,
              controller: controller,
              keyboardType: keyboardType,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              onChanged: onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: enabled
                  ? AppFonts.primaryRegularTextStyle
                  : AppFonts.greyRegularTextStyle,
              obscureText: obscure,
              textAlignVertical: TextAlignVertical.center,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              validator: validator,
              inputFormatters: inputFormatters,
              autofocus: autofocus,
              onTap: () {
                if (onTap != null) onTap!();
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                isDense: isDense,
                errorStyle: AppFonts.redRegularTextStyle.copyWith(
                  fontSize: AppSize.caption,
                ),
                counterText: "",
                hintText: value ?? placeholder,
                hintStyle: enabled
                    ? AppFonts.primaryLightTextStyle
                    : value != null
                        ? AppFonts.primaryRegularTextStyle
                        : AppFonts.primaryLightTextStyle,
                filled: true,
                fillColor: AppColors.white,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: AppSize.smallPadding,
                    right: AppSize.spaceSmall,
                  ),
                  child: prefixIcon,
                ),
                suffixIcon: suffixIcon,
                suffix: suffixText != null
                    ? Container(
                        margin: const EdgeInsets.only(
                          left: AppSize.smallPadding,
                          right: AppSize.spaceSmall,
                        ),
                        child: Text(
                          suffixText ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    : null,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0.0,
                  maxHeight: 25.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
