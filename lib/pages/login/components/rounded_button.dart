import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = appSecondryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: appSecondryColorLight,
                  blurRadius: 10,
                  offset: Offset(4, 3), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(29),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: ElevatedButton(
                child: Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
                onPressed: press,
                style: ElevatedButton.styleFrom(
                    primary: color,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    textStyle: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
