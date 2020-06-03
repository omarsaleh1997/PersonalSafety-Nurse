import 'package:flutter/material.dart';
import 'package:personalsafteynurse/Auth/login.dart';
import 'package:personalsafteynurse/screens/home.dart';
import 'package:personalsafteynurse/services/service_forgetpassword.dart';
import 'package:personalsafteynurse/services/service_login.dart';
import 'Auth/logout.dart';
import 'others/GlobalVar.dart';
import 'others/StaticVariables.dart';
import 'package:get_it/get_it.dart';
Future<void> main() async {
  //SocketHandler.ConnectSocket();
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await StaticVariables.Init();
  StaticVariables.prefs.setString("requestresult", "");
  StaticVariables.prefs.setInt("activerequestid", -1);
  GlobalVar.Set("anything", "stringValue");
  var token = StaticVariables.prefs.getString('token');
  print(token);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: token == null ? Logout() : Home()
home: Home(),

  ));
}

void setupLocator() {
  GetIt.instance.registerLazySingleton(() => LoginService());
  GetIt.instance.registerLazySingleton(() => ForgetPasswordService());
}
