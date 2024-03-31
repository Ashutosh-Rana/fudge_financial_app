import 'package:flutter/material.dart';
import 'package:fudge_financial_app/ui/design_components/custom_box.dart';
import 'package:fudge_financial_app/ui/utils/text_styles.dart';

class UserNameWithImage extends StatelessWidget {
  final String userName;
  final String imagePath;

  const UserNameWithImage({super.key, required this.userName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 60,width: 60,
          child: Image.asset(imagePath, filterQuality: FilterQuality.high, fit: BoxFit.fill,)),
        CustomSizedBox(height: screenHeight * .01, width: 0),
        Text(userName, style: TextStyles.robotoRegular12,),
      ],
    );
  }
}