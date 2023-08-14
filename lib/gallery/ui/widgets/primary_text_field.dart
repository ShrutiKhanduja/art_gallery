import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField(
      {Key? key,

      required this.hintText,
      this.helperText,
      this.suffixIconWidget,
      this.prefixIconWidget,
      this.textEditingController,
      this.focusNode,
      this.autoFocus = false,
      this.isEnabled = true,
      this.validatorFunction,
      this.keyboardType,
      this.prefixText,
      this.onChangedFunction,
      this.textCapitalization = TextCapitalization.sentences,
      this.onSavedFunction,
      this.maxLength,
      this.counterWidget = const Offstage(),
      this.onFieldSubmitted,
      this.initialValue,
      this.maxLines = 1,
      this.obscureText = false,
      this.radius = 10,
      this.inputFormatters,
      this.fieldLabelStyle})
      : super(key: key);

  final String hintText;
  final String? prefixText;
  final String? helperText;
  final Widget? suffixIconWidget;
  final Widget? prefixIconWidget;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool autoFocus;
  final String? Function(String?)? validatorFunction;
  final String? Function(String?)? onChangedFunction;
  final String? Function(String?)? onSavedFunction;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final bool isEnabled;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final Widget? counterWidget;
  final String? initialValue;
  final int? maxLines;
  final bool obscureText;
  final double radius;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? fieldLabelStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: isEnabled,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      controller: textEditingController,
      focusNode: focusNode,
      autofocus: autoFocus,
      validator: validatorFunction,
      onChanged: onChangedFunction,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSavedFunction,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.center,
      style:
          Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black),
      cursorColor: Colors.black,
      inputFormatters: inputFormatters,
      decoration: primaryTextFieldInputDecoration(
        helperText: helperText,
        hintText: hintText,
        prefixIconWidget: prefixIconWidget,
        suffixIconWidget: suffixIconWidget,
        prefixText: prefixText,
        context: context,
      ).copyWith(
        counter: counterWidget,
      ),
    );
  }
}

InputDecoration primaryTextFieldInputDecoration({
  String? helperText,
  Widget? prefixIconWidget,
  String? hintText,
  String? prefixText,
  Widget? suffixIconWidget,
  double leftPadding = 20.0,
  double radius = 10,
  required BuildContext context,
}) {
  return InputDecoration(
    helperText: helperText,
    prefixIcon: prefixIconWidget,
    prefixText: prefixText,
    suffixIcon: suffixIconWidget,
    prefixStyle:
        Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black),
    helperStyle: Theme.of(context).textTheme.caption,
    hintText: hintText,
    hintStyle: Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
    isDense: true,
    isCollapsed: true,
    contentPadding: EdgeInsets.only(
      left: leftPadding,
      top: 17,
      bottom: 17,
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(radius)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(radius)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: Colors.black)),
  );
}
