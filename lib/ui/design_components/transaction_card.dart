import 'package:flutter/material.dart';
import 'package:fudge_financial_app/ui/design_components/custom_box.dart';
import 'package:fudge_financial_app/ui/utils/text_styles.dart';

class TransactionCard extends StatelessWidget {
  final String userName;
  final String countryName;
  final String amount;
  final String date;
  final String status;

  const TransactionCard(
      {super.key,
      required this.userName,
      required this.countryName,
      required this.amount,
      required this.date,
      required this.status});

  Widget displayImage(String status) {
    switch (status) {
      case 'inprogress':
        return Image.asset('assets/images/inprogress.png');
      case 'completed': 
        return Image.asset(
            'assets/images/done.png'); 
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/user_icon.png", filterQuality: FilterQuality.high,),
        CustomSizedBox(height: 0, width: screenWidth * .05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userName,
              style: TextStyles.robotoRegular14,
            ),
            CustomSizedBox(height: screenHeight * .005, width: 0),
            Text(
              countryName,
              style: TextStyles.nunitoSansRegular12GreyUppercase,
            )
          ],
        ),
        CustomSizedBox(height: 0, width: screenWidth * .24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: TextStyles.robotoRegular14,
            ),
            CustomSizedBox(height: screenHeight * .005, width: 0),
            Text(
              date,
              style: TextStyles.nunitoSansRegular12GreyUppercase,
            )
          ],
        ),
        CustomSizedBox(height: 0, width: screenWidth * .055),
        displayImage(status)
      ],
    );
  }
}
