import 'package:flutter/material.dart';
import 'package:calc/app/helpers/screan_size.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    this.isExpanded = false,
  });

  final Function(String text) onPressed;
  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 4 - 10;
    var height = MediaQuery.of(context).size.height * 0.12;

    return isExpanded
        ? GestureDetector(
            onTap: () => onPressed(text),
            child: Container(
              alignment: Alignment.center,
              height: isPhone(context) ? width : height,
              width: width * 2 + 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: buttonColor,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 35,
                  color: textColor,
                ),
              ),
            ),
          )
        : Expanded(
            child: GestureDetector(
              onTap: () => onPressed(text),
              child: Container(
                width: width,
                height: isPhone(context) ? width : height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: buttonColor,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 35,
                    color: textColor,
                  ),
                ),
              ),
            ),
          );
  }
}
