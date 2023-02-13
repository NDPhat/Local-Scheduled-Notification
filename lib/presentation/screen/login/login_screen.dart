import 'package:flutter/material.dart';

import '../../../rsc/color.dart';
import '../../../rsc/text_style.dart';
import '../../../widget/button.dart';
import '../../navigation/routers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.06, right: size.width * 0.05),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                child: Image.asset(
                  "assets/image/background_welcome.png",
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.05,
                  child: Image.asset(
                    "assets/image/logo.png",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text(
                  'P E L L',
                  style: s30f700colorAccBlue,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text(
                  'A notification is very needed for everyone.\nThis app is easy to use and clean.',
                  style: s16f400ColorGreySe,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.372,
                  child: Image.asset(
                    "assets/image/image_welcome.png",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.0612,
                ),
                RoundedButton(
                  text: 'GO',
                  textColor: colorSystemWhite,
                  color: colorMainBlue,
                  press: () {
                    Navigator.pushNamed(context, Routers.home);
                  },
                  size: size.width * 0.8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
