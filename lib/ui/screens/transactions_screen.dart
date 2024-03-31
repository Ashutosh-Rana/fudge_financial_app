import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudge_financial_app/ui/design_components/custom_box.dart';
import 'package:fudge_financial_app/ui/design_components/transaction_card.dart';
import 'package:fudge_financial_app/ui/utils/colors.dart';
import 'package:fudge_financial_app/ui/utils/text_styles.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int selectedImageIndex = 0; // 0 for first image, 1 for second image
  int selectedMenuIndex =
      0; // 0 for first menu item, 1 for second menu item and so on
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

  double getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width + 8;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My saved cards',
          style: TextStyles.aeonikBold20,
        ),
        actions: [
          SvgPicture.asset(
            "assets/images/Icon material-menu.svg",
            fit: BoxFit.cover,
          ),
          CustomSizedBox(height: 0, width: screenWidth * .08),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * .03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBox(height: screenHeight * .02, width: 0),
              NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    // Calculate selectedImageIndex based on scroll position
                    double scrollOffset = notification.metrics.pixels;
                    double imageSize = screenWidth * .3;
                    int newIndex = (scrollOffset / imageSize).floor();
                    setState(() {
                      selectedImageIndex = newIndex;
                    });
                  }
                  return false;
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomSizedBox(height: 0, width: screenWidth * .01),
                      Image.asset("assets/images/Visa Card.png"),
                      CustomSizedBox(height: 0, width: screenWidth * .03),
                      Image.asset("assets/images/Visa Card Copy 2.png")
                    ],
                  ),
                ),
              ),
              CustomSizedBox(
                height: screenHeight * .04,
                width: 0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: selectedImageIndex == 0
                      ? screenWidth * .05
                      : screenWidth * .025,
                  height: 5.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: selectedImageIndex == 0
                        ? AppColors.black
                        : AppColors.grey, // Highlight based on index
                  ),
                ),
                CustomSizedBox(height: 0, width: 10.0), // Spacing between dots
                Container(
                  width: selectedImageIndex == 1
                      ? screenWidth * .05
                      : screenWidth * .025,
                  height: 5.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: selectedImageIndex == 1
                        ? AppColors.black
                        : AppColors.grey, // Highlight based on index
                  ),
                ),
              ]),
              CustomSizedBox(
                height: screenHeight * .04,
                width: 0,
              ),
              Stack(alignment: Alignment.bottomCenter, children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4, // Total number of menu titles
                            (index) => Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * .03,
                                  right: screenWidth * .03),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMenuIndex = index;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Menu Title ${index + 1}',
                                      style: selectedMenuIndex == index
                                          ? TextStyles.robotoBold14Uppercase
                                          : TextStyles
                                              .nunitoSansRegular14GreyBoldUppercase,
                                    ),
                                    selectedMenuIndex == index
                                        ? Visibility(
                                            visible: selectedMenuIndex == index,
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 4),
                                                width: getTextWidth(
                                                  "Menu Title ${index + 1}",
                                                  selectedMenuIndex == index
                                                      ? TextStyles
                                                          .robotoBold14Uppercase
                                                      : TextStyles
                                                          .robotoRegular12,
                                                ),
                                                height: 5,
                                                color: AppColors.black),
                                          )
                                        : Container(
                                            height: 8,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      CustomSizedBox(height: 3, width: 0)
                    ],
                  ),
                ),
                // CustomSizedBox(height: 10, width: 0),
                Divider(
                  height: 5,
                  indent: screenWidth * .03,
                  thickness: 1,
                  color: AppColors.grey,
                )
              ]),
              CustomSizedBox(height: screenHeight * .02, width: 0),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * .03),
                child: const Text(
                  "RECENT TRANSACTIONS",
                  style: TextStyles.robotoBold14Uppercase,
                ),
              ),
              CustomSizedBox(height: screenHeight * .02, width: 0),
              ListView.separated(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: screenWidth * .03),
                    child: transactions[
                        index],
                  ); // Each card is a TransactionCard widget
                },
                separatorBuilder: (context, index) => CustomSizedBox(
                    height: screenHeight * .025, width: 0), // Add separators
              ),
              CustomSizedBox(height: screenHeight * .05, width: 0)
            ],
          ),
        ),
      ),
    );
  }
}
