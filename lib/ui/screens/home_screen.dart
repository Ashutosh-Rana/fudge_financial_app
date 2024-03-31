import 'package:flutter/material.dart';
import 'package:fudge_financial_app/ui/design_components/chart_animation_widget.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:fudge_financial_app/ui/design_components/custom_box.dart';
import 'package:fudge_financial_app/ui/design_components/custom_divider.dart';
import 'package:fudge_financial_app/ui/design_components/home_screen_summary_card.dart';
import 'package:fudge_financial_app/ui/design_components/scrollable_user_name_list.dart';
import 'package:fudge_financial_app/ui/design_components/transaction_card.dart';
import 'package:fudge_financial_app/ui/utils/colors.dart';
import 'package:fudge_financial_app/ui/utils/constants.dart';
import 'package:fudge_financial_app/ui/utils/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TransactionCard> transactions = [
    const TransactionCard(
      userName: "John Doe",
      countryName: "United Kingdom",
      amount: "80,000 AED",
      date: "11 Aug 2021",
      status: "inprogress",
    ),
    const TransactionCard(
      userName: "John Doe",
      countryName: "United Kingdom",
      amount: "80,000 AED",
      date: "11 Aug 2021",
      status: "completed",
    ),
    const TransactionCard(
      userName: "John Doe",
      countryName: "United Kingdom",
      amount: "80,000 AED",
      date: "11 Aug 2021",
      status: "completed",
    ),
    const TransactionCard(
      userName: "John Doe",
      countryName: "United Kingdom",
      amount: "80,000 AED",
      date: "11 Aug 2021",
      status: "completed",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return
        Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SummaryCard(),
            CustomSizedBox(height: screenHeight * .03, width: 0),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * .05, right: screenWidth * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "PERFORMANCE CHART",
                    style: TextStyles.robotoBold14Uppercase,
                  ),
                  Image.asset(
                    'assets/images/SUCCESS!.png',
                  )
                ],
              ),
            ),
            CustomSizedBox(height: screenHeight * .03, width: 0),
            ChartAnimationWidget(),
            CustomSizedBox(height: screenHeight * .08, width: 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * .05, right: screenWidth * .05),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "TOP USERS FROM YOUR COMMUNITY",
                        style: TextStyles.robotoBold14Uppercase,
                      )),
                ),
                CustomSizedBox(height: screenHeight * .03, width: 0),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * .03),
                  child: ScrollableUserNameList(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * .05, right: screenWidth * .05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "RECENT TRANSACTIONS",
                          style: TextStyles.robotoBold14Uppercase,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, transactionRoute);
                          },
                          child: Image.asset(
                            'assets/images/SUCCESS!.png',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        return transactions[
                            index]; // Each card is a TransactionCard widget
                      },
                      separatorBuilder: (context, index) => CustomSizedBox(
                          height: screenHeight * .025,
                          width: 0), // Add separators
                    ),
                    CustomSizedBox(height: screenHeight * .04, width: 0),
                    const Text(
                      "FINANCIAL GOALS",
                      style: TextStyles.robotoBold14Uppercase,
                    ),
                    CustomSizedBox(height: screenHeight * .03, width: 0),
                    const Text(
                      "XX of total XX",
                      style: TextStyles.nunitoSansRegular14GreyUppercase,
                    ),
                    CustomSizedBox(height: screenHeight * .02, width: 0),
                    const CustomDivider(color: AppColors.blue, percentage: 30),
                    CustomSizedBox(height: screenHeight * .04, width: 0),
                    const Text(
                      "XX of total XX",
                      style: TextStyles.nunitoSansRegular14GreyUppercase,
                    ),
                    CustomSizedBox(height: screenHeight * .02, width: 0),
                    const CustomDivider(color: AppColors.red, percentage: 80),
                    CustomSizedBox(height: screenHeight * .04, width: 0),
                    const Text(
                      "XX of total XX",
                      style: TextStyles.nunitoSansRegular14GreyUppercase,
                    ),
                    CustomSizedBox(height: screenHeight * .02, width: 0),
                    const CustomDivider(
                        color: AppColors.lightShadeCyan, percentage: 70),
                    CustomSizedBox(height: screenHeight * .04, width: 0),
                    CustomSizedBox(height: screenHeight * .02, width: 0),
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
