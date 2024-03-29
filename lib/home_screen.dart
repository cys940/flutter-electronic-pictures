import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int curPage = controller.page!.toInt();
      int nxtPage = curPage + 1;

      if (nxtPage > 4) {
        nxtPage = 0;
      }

      controller.animateToPage(
          nxtPage,
          duration: Duration(milliseconds: 400),
          curve: Curves.linear
      );
    });
  }


  @override
  void dispose() {
    controller.dispose();

    if (timer != null)
      timer!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map((item) =>
            Image.asset('asset/img/image_$item.jpeg', fit: BoxFit.cover))
            .toList(),
      ),
    );
  }
}
