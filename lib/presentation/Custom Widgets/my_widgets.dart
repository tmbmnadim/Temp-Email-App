import 'package:flutter/material.dart';

/// These are some widgets that I created for own projects.

class CustomWidgets {
  Widget customTextField({
    String? hintText,
    String? labelText,
    required TextEditingController controller,
    Function(String)? onChanged,
    Widget? prefixIcon,
    Color prefixIconColor = Colors.black26,
    Widget? suffixIcon,
    Color suffixIconColor = Colors.black26,
    bool obscureText = false,
    bool enabled = true,
    Color focusedColor = Colors.blue,
    Color fillColor = Colors.white,
    Color enabledBorderColor = Colors.black,
    Color hintColor = Colors.black,
    Color labelColor = Colors.black,
    Color textColor = Colors.black,
    Color cursorColor = Colors.black,
    var validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    // bool buttonPressed = false;
    return SizedBox(
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),cursorColor: cursorColor,
        onChanged: onChanged,
        enabled: enabled,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 15,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: focusedColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: enabledBorderColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: labelColor),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
        ),
      ),
    );
  }

  Widget customTextButton({
    required String buttonText,
    required Function() onTap,
    Color splashColor = Colors.white,
    Color color = Colors.white,
    Color textColor = Colors.black,
    double borderRadius = 10,
    double fontSize = 25,
    FontWeight fontWeight = FontWeight.w500,
    String? fontFamily,
    double width = 200,
    double height = 60,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customButton({
    Widget? child,
    required Function() onTap,
    Color splashColor = Colors.white,
    Color color = Colors.white,
    Color borderColor = Colors.transparent,
    double borderWidth = 0,
    double borderRadius = 10,
    double width = 200,
    double height = 60,
    DecorationImage? decorationImage,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            image: decorationImage,
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
