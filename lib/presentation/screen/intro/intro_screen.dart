import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/intro.dart';
import '../../../rsc/color.dart';
import '../../../rsc/text_style.dart';
import '../../navigation/routers.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  final List<Onboard> listOnboard = <Onboard>[];
  //
  void _handleTimeUsingApp(value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("flag", value);
    });
  }

  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    listOnboard.add(Onboard('assets/image/bell.png',
        'Flutter Local Notification', 'An app for create your notification'));
    listOnboard.add(Onboard('assets/image/image1.png',
        'It is an app make by myself', 'Simple,beautiful and easy to use'));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.07,
          left: size.width * 0.04,
          right: size.width * 0.04,
          bottom: size.height * 0.013,
        ),
        child: SafeArea(
            child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                right: size.width * 0.055,
              ),
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: const Text(
                  'Skip',
                  style: s16f700ColorGreyTe,
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routers.login);
                  _handleTimeUsingApp("0");
                },
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: listOnboard.length,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) => IntroBody(
                            pathImage: listOnboard[index].pathImage,
                            title: listOnboard[index].title,
                            subtitle: listOnboard[index].bodyTitle,
                            size: size,
                          )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      ...List.generate(
                          listOnboard.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(
                                  right: size.width * 0.01,
                                ),
                                child: DotIndicator(
                                  isActive: index == _pageIndex,
                                  size: size,
                                ),
                              )),
                    ]),
                    SizedBox(
                      width: size.width * 0.36,
                      height: size.height * 0.055,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageIndex == 1) {
                            Navigator.pushNamed(context, Routers.login);
                            _handleTimeUsingApp("0");
                          } else {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.ease);
                          }
                        },
                        child: const Text('Continue'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false, required this.size})
      : super(key: key);
  final bool isActive;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? size.width * 0.07 : size.width * 0.016,
      height: size.height * 0.008,
      decoration: BoxDecoration(
          color: isActive ? colorMainBlue : colorGreyTetiary,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}

class IntroBody extends StatelessWidget {
  const IntroBody({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.subtitle,
    required this.size,
  }) : super(key: key);
  final String pathImage;
  final String title;
  final String subtitle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: size.height * 0.05),
          height: size.height * 0.4,
          child: Image.asset(
            pathImage,
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        Container(
          width: size.width * 0.875,
          height: size.height * 0.045,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.04,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.02,
                  color: colorBlueQuaternery,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.04,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: s22f700colorGreyPri,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Container(
          width: size.width * 0.856,
          child: Text(
              textAlign: TextAlign.center, subtitle, style: s14f400ColorGreyTe),
        ),
      ],
    );
  }
}
