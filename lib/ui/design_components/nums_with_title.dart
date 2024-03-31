import 'package:flutter/material.dart';
import 'package:fudge_financial_app/ui/design_components/custom_box.dart';
import 'package:fudge_financial_app/ui/utils/colors.dart';
import 'package:fudge_financial_app/ui/utils/text_styles.dart';

class NumsWithTitle extends StatelessWidget {
  final String num;
  final String title;

  const NumsWithTitle({super.key, required this.num, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(num, style: TextStyles.robotoBold18WhiteLineSpacing21),
        CustomSizedBox(height: screenHeight * .01, width: 0),
        Text(title,
            style: TextStyles.robotoRegular12WhiteLineSpacing14
                .copyWith(color: AppColors.white.withOpacity(0.5))),
      ],
    );
  }
}
