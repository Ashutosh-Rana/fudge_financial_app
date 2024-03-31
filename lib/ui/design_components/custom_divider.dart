import 'package:flutter/material.dart';
import 'package:fudge_financial_app/ui/utils/colors.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final double percentage;

  const CustomDivider({
    super.key,
    required this.color,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width;
    final paddedWidth = availableWidth * .2;
    final coverWidth = (availableWidth - paddedWidth) * percentage/100;

    return Row(
      children: [
        Container(
          height: 4,
          width: coverWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 4,
            decoration:const BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
