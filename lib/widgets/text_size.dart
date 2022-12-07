import 'package:flutter/material.dart';
import 'package:payment_app/widgets/dimentions.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  const SizedText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                color: color,
                fontSize: Dimensions.font16,
                fontWeight: FontWeight.w700),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
          ),
          SizedBox(
            height: Dimensions.height10 * 0.5,
          ),
          Row(
            children: [
              for (int i = 0;
                  i < textSize.width / (Dimensions.width10 * 0.5);
                  i++)
                i.isEven
                    ? Container(
                        width: Dimensions.width10 * 0.6,
                        color: color,
                        height: Dimensions.height10 * 0.2,
                      )
                    : Container(
                        width: Dimensions.width10 * 0.5,
                        color: Colors.white,
                        height: Dimensions.height10 * 0.2,
                      )
            ],
          )
        ],
      ),
    );
  }

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: text,
            style: TextStyle(
                color: color,
                fontSize: Dimensions.font16,
                fontWeight: FontWeight.w700)),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
