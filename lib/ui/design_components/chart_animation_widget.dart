import 'package:flutter/material.dart';

class ChartAnimationWidget extends StatefulWidget {
  @override
  _ChartAnimationWidgetState createState() => _ChartAnimationWidgetState();
}

class _ChartAnimationWidgetState extends State<ChartAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start from the right side
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      child: SlideTransition(
        position: _animation,
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth * .03),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/chart.png',
              // height: MediaQuery.of(context).size.height * 0.3,
              // width: MediaQuery.of(context).size.width * 0.9,
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
