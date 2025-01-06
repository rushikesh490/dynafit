import 'package:control_style/control_style.dart';
import 'package:dynafit/core/constants/app_colors.dart';
import 'package:dynafit/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final String? suffixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final bool? obscureText;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final Color? borderColour;
  final Color? errorColour;
  final Color? hintTextColour;
  final TextInputType? textInputType;
  final bool? readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final Widget? prefixIcon;
  final int? errorMaxLine;
  final String? comingFrom;
  final String? backgroundImage;
  final TextCapitalization? textCapitalization;
  final bool? enableInteractiveSelection;
  final List<TextInputFormatter>? inputFormatters;
  final GestureTapCallback? onTap;

  const CommonTextField(
      {this.controller,
        Key? key,
        this.suffixText,
        this.prefixIcon,
        this.hintText,
        this.enabled,
        this.contentPadding,
        this.onSubmitted,
        this.onChanged,
        this.validator,
        this.inputAction,
        this.focusNode,
        this.obscureText,
        this.prefixWidget,
        this.suffixIcon,
        this.borderColour,
        this.errorColour,
        this.hintTextColour,
        this.textInputType,
        this.errorMaxLine,
        this.readOnly,
        this.comingFrom,
        this.backgroundImage,
        this.textCapitalization,
        this.inputFormatters,
        this.enableInteractiveSelection,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkTheme = theme.brightness == Brightness.dark;

    return TextFormField(
      onTap: onTap,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        filled: true,
        fillColor: (enabled ?? true)
            ? isDarkTheme
            ? AppColors.darkInput
            : AppColors.lightInput
            : Colors.transparent,
        suffix: suffixText != null
            ? const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text('%', style: TextStyle(color: Colors.white)),
        )
            : null,
        hintText: hintText,
        hintStyle: AppTextStyles.regular18.copyWith(
            color: isDarkTheme
                ? AppColors.darkCard.shade300
                : AppColors.lightSecondary),
        border: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                  color: isDarkTheme
                      ? Colors.black.withOpacity(.45)
                      : AppColors.lightShadow1,
                  blurRadius: 12,
                  offset: const Offset(6, 6),
                  spreadRadius: 0),
              BoxShadow(
                color: isDarkTheme
                    ? Colors.white.withOpacity(.05)
                    : AppColors.white.withOpacity(0.2),
                blurRadius: 12,
                spreadRadius: 0,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        counterText: '',
        prefix: prefixWidget,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??
            EdgeInsets.only(
                left: 16,
                top: 14,
                bottom: 14),
        errorStyle: const TextStyle(
            color: AppColors.red, overflow: TextOverflow.visible),
        disabledBorder: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                color: isDarkTheme
                    ? Colors.black.withOpacity(.45)
                    : AppColors.lightShadow1,
                blurRadius: 12,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: isDarkTheme
                    ? Colors.white.withOpacity(.05)
                    : AppColors.white.withOpacity(0.2),
                blurRadius: 12,
                // spreadRadius: 5,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.transparent))),
        errorBorder: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                color: isDarkTheme
                    ? Colors.black.withOpacity(.45)
                    : AppColors.lightShadow1,
                blurRadius: 12,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: isDarkTheme
                    ? Colors.white.withOpacity(.05)
                    : AppColors.white.withOpacity(0.2),
                blurRadius: 12,
                // spreadRadius: 5,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: errorColour ?? AppColors.red,
                ))),
        focusedErrorBorder: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                color: isDarkTheme
                    ? Colors.black.withOpacity(.45)
                    : AppColors.lightShadow1,
                blurRadius: 12,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: isDarkTheme
                    ? Colors.white.withOpacity(.05)
                    : AppColors.white.withOpacity(0.2),
                blurRadius: 12,
                // spreadRadius: 5,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: errorColour ?? AppColors.red,
                ))),
        focusedBorder: DecoratedInputBorder(
          innerShadow: [
            BoxShadow(
              color: isDarkTheme
                  ? Colors.black.withOpacity(.45)
                  : AppColors.lightShadow1,
              blurRadius: 12,
              offset: const Offset(6, 6),
            ),
            BoxShadow(
              color: isDarkTheme
                  ? Colors.white.withOpacity(.05)
                  : AppColors.white.withOpacity(0.2),
              blurRadius: 12,
              // spreadRadius: 5,
              offset: const Offset(-6, -6),
            )
          ],
          child: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkPrimary,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        enabledBorder: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                color: isDarkTheme
                    ? Colors.black.withOpacity(.45)
                    : AppColors.lightShadow1,
                blurRadius: 12,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: isDarkTheme
                    ? Colors.white.withOpacity(.05)
                    : AppColors.white.withOpacity(0.2),
                blurRadius: 12,
                // spreadRadius: 5,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: isDarkTheme?Colors.transparent:Colors.transparent, width: 0.5 ))),
        errorMaxLines: errorMaxLine,
      ),
      readOnly: readOnly ?? false,
      enabled: enabled,
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      enableInteractiveSelection: enableInteractiveSelection ?? true,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      textInputAction: inputAction,
      focusNode: focusNode,
      obscureText: obscureText != null ? obscureText! : false,
      inputFormatters: inputFormatters,
    );
  }
}
