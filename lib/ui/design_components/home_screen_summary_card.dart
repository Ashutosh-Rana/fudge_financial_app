import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudge_financial_app/ui/design_components/custom_box.dart';
import 'package:fudge_financial_app/ui/design_components/nums_with_title.dart';
import 'package:fudge_financial_app/ui/utils/colors.dart';
import 'package:fudge_financial_app/ui/utils/text_styles.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.45,
      width: screenWidth,
      // alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: AppColors.darkBlueColor),
      child: Column(
        children: [
          CustomSizedBox(height: screenHeight * .08, width: 0),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSizedBox(height: 0, width: screenWidth * .1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Hola, ',
                            style: TextStyles.aeonikBold20White),
                        TextSpan(
                            text: 'Michael', style: TextStyles.aeonikRegular20),
                      ],
                    ),
                  ),
                  CustomSizedBox(height: screenHeight * .01, width: 0),
                  const Text("Te tenemos excelentes noticias para ti",
                      style: TextStyles.aeonikRegular10)
                ],
              ),
              CustomSizedBox(height: 0, width: screenWidth * .17),
              SvgPicture.asset(
                "assets/images/bell.svg",
                color: AppColors.white,
                height: 27,
                width: 27,
              ),
              CustomSizedBox(height: 0, width: screenWidth * .07),
              SizedBox(
                height: 27,
                width: 27,
                child: Image.asset(
                  "assets/images/user_profile.png",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          CustomSizedBox(height: screenHeight * .05, width: 0),
          Text(
            "\$56,271.68",
            style: TextStyles.robotoBold34,
          ),
          CustomSizedBox(height: screenHeight * .01, width: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+\$9736",
                style: TextStyles.robotoRegular15White,
              ),
              CustomSizedBox(height: 0, width: 20),
              Icon(
                Icons.arrow_upward,
                color: AppColors.green,
              ),
              CustomSizedBox(height: 0, width: 5),
              Text(
                "2.3%",
                style: TextStyles.robotoRegular15Green,
              ),
            ],
          ),
          CustomSizedBox(height: screenHeight * .01, width: 0),
          Text(
            "ACCOUNT BALANCE",
            style: TextStyles.robotoRegular15White
                .copyWith(color: AppColors.white.withOpacity(0.5)),
          ),
          CustomSizedBox(height: screenHeight * .05, width: 0),
          SizedBox(
            height: screenHeight * .054,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSizedBox(height: 0, width: screenWidth * .02),
                NumsWithTitle(num: "12", title: "Following"),
                VerticalDivider(color: AppColors.white.withOpacity(0.5), thickness: 1,),
                NumsWithTitle(num: "36", title: "Transactions"),
                VerticalDivider(color: AppColors.white.withOpacity(0.5), thickness: 1,),
                NumsWithTitle(num: "4", title: "Bills"),
                CustomSizedBox(height: 0, width: screenWidth * .02),
              ],
            ),
          )
        ],
      ),
    );
  }
}
