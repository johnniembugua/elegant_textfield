import 'package:flutter/material.dart';

class ElegantInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Function onChange;
  final Function onDone;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color borderColor;
  final TextEditingController? textFieldController;
  final Function? suffixTap;
  final Function? validateTextField;
  final Color? filledColor;
  final bool isSecure;
  final int lineHeight;
  final double labelFontSize;
  final double hintFontSize;
  final bool enabled;

  const ElegantInputField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.onChange,
    required this.onDone,
    this.prefixWidget,
    this.suffixWidget,
    this.borderColor = Colors.grey,
    this.textFieldController,
    this.suffixTap,
    this.validateTextField,
    this.filledColor = Colors.white,
    this.isSecure = false,
    this.lineHeight = 1,
    this.labelFontSize = 16,
    this.enabled = true,
    this.hintFontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        const SizedBox(height: 10),
        TextFormField(
          controller: textFieldController,
          obscureText: isSecure,
          maxLines: lineHeight,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            errorStyle: const TextStyle(
              fontSize: 16,
            ),
            filled: true,
            enabled: enabled,
            fillColor: filledColor,
            hintText: hintText,
            prefixIcon: prefixWidget,
            suffixIcon: suffixWidget,
            labelStyle: TextStyle(
              fontSize: labelFontSize,
            ),
            hintStyle: TextStyle(
              fontSize: hintFontSize,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(.7),
                borderSide: BorderSide(color: borderColor, width: .7)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0.7)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor, width: 0.7)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor, width: 0.7)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor, width: 0.9)),
          ),
          onChanged: (String str) {
            onChange(str);
          },
          validator: (String? value) {
            return validateTextField!(value);
          },
          onEditingComplete: () {
            onDone();
          },
        ),
      ],
    );
  }
}
