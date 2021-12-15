import 'package:matrix_game/data/models/user_model.dart';
import 'package:matrix_game/domain/methods/verificacion_metodos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
//variables observarbles
  var isLogged = false.obs; //variable observable (obs)
  final _userActive = Rx<UserModel?>(null);
  AuthManagement authManagement = Get.find();
//Este es el contructor de la clase y  llama al getLoggedUser
  AuthenticationController() {
    getLoggedUser();
  }

  // Este Método trae la info del usuario cuando el usuario tiene una sesión activa
  getLoggedUser() async {
    _userActive.value = await authManagement.getLoggedUser();
    if (_userActive.value != null) {
      isLogged.value = true;
    }
  }

//crear los métodos login, logout y signup
  Future<void> login(email, password) async {
    try {
      _userActive.value =
          await authManagement.signIn(email: email, password: password);
      print("comienzo xd");
      //print(_userActive.value!.toMap());
      print("termino xd");
      if (_userActive.value != null) {
        print("entre");
        isLogged.value = true;
      }
    } catch (e) {
      return Future.error(e);
    }
    printInfo(info: 'Ok');
  }

  void logout() async {
    await authManagement.signOut();
    isLogged.value = false; // el estado cambia al momento de salir (signUp)
  }

  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }

  String getUid() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return uid;
  }

  Future<void> signup({email, password, userName, nickName}) async {
    //Este signup es del contrlador
    try {
      await authManagement.signUp(
          // Este signUp se comunica con el authManagement
          email: email,
          password: password,
          name: userName,
          nick: nickName);
    } catch (e) {
      return Future.error(e);
    }
  }
}
