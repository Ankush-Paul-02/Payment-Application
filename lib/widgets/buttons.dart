import 'package:flutter/material.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/widgets/dimentions.dart';

class AppButtons extends StatelessWidget {
  final double? fontSize;
  final IconData icon;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? text;

  const AppButtons({
    Key? key,
    this.fontSize = 20,
    this.textColor = AppColor.mainColor,
    this.iconColor = Colors.white,
    required this.icon,
    this.onTap,
    this.backgroundColor = AppColor.mainColor,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: Dimensions.width40,
            height: Dimensions.height20 * 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.width20),
                color: backgroundColor),
            child: Icon(
              icon,
              size: Dimensions.width30,
              color: iconColor,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: text != null
                ? Text(
                    text!,
                    style: TextStyle(
                        fontSize: Dimensions.font14, color: textColor),
                    textAlign: TextAlign.center,
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
