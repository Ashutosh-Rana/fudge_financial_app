import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudge_financial_app/ui/design_components/custom_box.dart';
import 'package:fudge_financial_app/ui/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenWidth);
    print(screenHeight);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.4,
              width: screenWidth,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppColors.darkBlueColor),
            ),
            CustomSizedBox(height: screenHeight * .03, width: 0),
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/chart.svg',
                // height: screenHeight * 0.13,
                // width: screenWidth * 0.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
