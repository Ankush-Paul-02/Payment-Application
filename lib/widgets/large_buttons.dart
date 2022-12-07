import 'package:flutter/material.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/widgets/dimentions.dart';

class AppLargeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onTap;
  final bool? isBorder;
  final String text;

  const AppLargeButton(
      {Key? key,
      this.backgroundColor: AppColor.mainColor,
      this.textColor,
      this.onTap,
      this.isBorder,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.width30),
        height: Dimensions.height60,
        width: MediaQuery.of(context).size.width - Dimensions.width60,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(Dimensions.width10),
            border: Border.all(
                width: Dimensions.width10 * 0.2, color: AppColor.mainColor)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: Dimensions.font30,
                color: textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
