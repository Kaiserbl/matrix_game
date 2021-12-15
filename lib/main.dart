import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:matrix_game/domain/controller/image_controller.dart';
import 'package:matrix_game/domain/controller/state_controller.dart';
import 'package:matrix_game/domain/controller/state_controller2.dart';
import 'package:matrix_game/domain/use_case/controllers/location.dart';
import 'package:matrix_game/domain/use_case/controllers/permissions.dart';
import 'package:matrix_game/domain/use_case/permission_management.dart';
import 'package:matrix_game/ui/pages/login/login_widget.dart';
import 'package:matrix_game/ui/widgets/pages/firebase_central.dart';

//probando rama juan
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(StateController());
  Get.put(StateController2());
  Get.put(Image_Control());
  PermissionsController permissionsController =
      Get.put(PermissionsController());
  permissionsController.permissionManager = PermissionManager();
  Get.put(LocationController());
  runApp(MyApp());
}

//6000+8000
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'proyecto mintic',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            body: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("error ${snapshot.error}");
              return Wrong();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return FirebaseCentral();
            }

            return Loading();
          },
        )));
  }
}

class Wrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Something went wrong")),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Loading")),
    );
  }
}
