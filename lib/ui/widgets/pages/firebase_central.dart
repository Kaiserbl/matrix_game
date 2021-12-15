import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_mintic/ui/pages/inicio/inicio_widget.dart';
import 'package:proyecto_mintic/ui/pages/login/login_widget.dart';

class FirebaseCentral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InicioWidget();
        } else {
          return LoginWidget();
        }
      },
    );
  }
}
