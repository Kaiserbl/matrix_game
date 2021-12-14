import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:proyecto_mintic/domain/controller/image_controller.dart';
import 'package:proyecto_mintic/domain/controller/state_controller.dart';
import 'package:proyecto_mintic/domain/controller/state_controller2.dart';
import 'package:proyecto_mintic/domain/use_case/controllers/location.dart';
import 'package:proyecto_mintic/domain/use_case/controllers/permissions.dart';
import 'package:proyecto_mintic/domain/use_case/permission_management.dart';
import 'package:proyecto_mintic/ui/pages/login/login_widget.dart';

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
      home: LoginWidget(),
    );
  }
}
