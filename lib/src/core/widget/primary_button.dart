
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_colors.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_fonts.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_size.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final double buttonTextSize;
  final VoidCallback? onPressed;
  final double? height;
  final bool isLoading;
  final double? width;
  final Color? backgroundColor;
  final double? radius;
  final double? elevation;
  final bool enable;
  final Color? textColor;
  final bool isHaveBottomPadding;
  final Widget? icon;

  const PrimaryButton({
    super.key,
    required this.buttonText,
    this.buttonTextSize = 20,
    required this.onPressed,
    this.height,
    this.isLoading = false,
    this.width,
    this.backgroundColor,
    this.radius,
    this.elevation,
    this.enable = true,
    this.textColor,
    this.isHaveBottomPadding = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: isHaveBottomPadding ? AppSize.smallPadding : 0),
      child: SizedBox(
        height: height ?? 44,
        width: width ?? double.infinity,
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : ElevatedButton(
                onPressed: enable ? onPressed : null,
                style: TextButton.styleFrom(
                  backgroundColor: backgroundColor ??
                      (enable
                          ? AppColors.primaryColor
                          : AppColors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.radius),
                  ),
                  elevation: elevation ?? 1,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) Row(
                        children: [
                          icon!,
                          const SizedBox(
                            width: AppSize.extraSmallPadding,
                          ),
                        ],
                      ),
                      Text(
                        buttonText,
                        style: enable
                            ? AppFonts.whiteSemiBoldTextStyle
                                .copyWith(color: textColor)
                            : AppFonts.greySemiBoldTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
