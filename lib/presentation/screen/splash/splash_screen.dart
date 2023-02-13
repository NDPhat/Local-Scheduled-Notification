import 'package:appsche/presentation/navigation/routers.dart';
import 'package:appsche/rsc/color.dart';
import 'package:appsche/rsc/text_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, Routers.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: colorSystemWhite,
      body: Padding(
          padding: EdgeInsets.only(top: size.height*0.2),
          child: Column(children: [
        Image.asset('assets/image/splash.jpg'),
        Padding(
          padding: EdgeInsets.only(left: size.width*0.4),
          child: const Row(
            children: [
              Text(
                'P',
                style: s40f700colorAccBlue,
              ),
              Text(
                'E',
                style: s40f700colorEror,
              ),
              Text(
                'L',
                style: s40f700colorGrey,
              ),
              Text(
                'L',
                style: s40f700colorYellow,
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
