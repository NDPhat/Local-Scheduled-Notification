import 'package:appsche/Notify/notifier.dart';
import 'package:appsche/data/di/setupProject.dart';
import 'package:appsche/presentation/navigation/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
GetIt instance = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  setUpProject();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await NotifyHelper().initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: Routers.home,
      onGenerateRoute: Routers.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     super.key,
//   });
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var notifi = NotifyHelper();
//   @override
//   void initState() {
//     super.initState();
//     notifi.initializeNotification();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         body: Center(
//       child: ElevatedButton(
//           onPressed: () {
//             notifi.displayNotification(
//                 title: "Theme Change", body: "Show Notifi");
//             notifi.scheduledNotification();
//           },
//           child: Text('Click')),
//     ));
//   }
// }
