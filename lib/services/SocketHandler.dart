import 'dart:convert';
import 'package:personalsafteynurse/others/GlobalVar.dart';
import 'package:signalr_client/signalr_client.dart';
import 'package:http/http.dart' as http;

import '../models/api_response.dart';
import '../others/StaticVariables.dart';

class SocketHandler {


  static String token = "";
  static bool result = false;
  static var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  static Future<APIResponse<dynamic>> GetBasicInfo() {
    print('*****************');
    token = StaticVariables.prefs.getString('token');
    print("Getting basic info..");
    String url = StaticVariables.API + 'api/Account/Personnel/GetBasicInfo';
    return http
        .get(url,
        headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        Map userMap = jsonDecode(data.body);
        var APIresult = APIResponse.fromJson(userMap);
        print(APIresult.status);
        print(APIresult.result);
        GlobalVar.Set("basicinfo", APIresult.result);
        //result = APIresult.result;
        print(APIresult.hasErrors);
        return APIresult;
      } else {
        print('============================');
        print(data.statusCode);
        print("-----------------------------");
      }
      return APIResponse<dynamic>(
          hasErrors: true, messages: "An Error Has Occured");
    }).catchError((_) => APIResponse<dynamic>(
        hasErrors: true, messages: "An Error Has Occured"));
  }

  static Future<APIResponse<dynamic>> GetClientDetails(String clientEmail) {
    print('*****************');
    token = StaticVariables.prefs.getString('token');
    print("Sending GetClientDetails with email: " + clientEmail.replaceAll("@", "%40"));
    String url = StaticVariables.API + 'api/Nurse/GetClientDetails' + '?clientEmail=' + clientEmail;
    return http
        .get(url,
        headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        Map userMap = jsonDecode(data.body);
        var APIresult = APIResponse.fromJson(userMap);
        print(APIresult.status);
        print(APIresult.result);
        GlobalVar.Set("clientdetails", APIresult.result);
        //result = APIresult.result;
        print(APIresult.hasErrors);
        return APIresult;
      } else {
        print('============================');
        print(data.statusCode);
        print("-----------------------------");
      }
      return APIResponse<dynamic>(
          hasErrors: true, messages: "An Error Has Occured");
    }).catchError((_) => APIResponse<dynamic>(
        hasErrors: true, messages: "An Error Has Occured"));
  }

  static Future<APIResponse<dynamic>> MarkClientAsPositive(String clientEmail) {
    print('*****************');
    token = StaticVariables.prefs.getString('token');
    print("Sending MarkClientAsPositive with email: " + clientEmail.replaceAll("@", "%40"));
    String url = StaticVariables.API + 'api/Nurse/MarkClientAsPositive' + '?clientEmail=' + clientEmail;
    return http
        .put(url,
        headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        Map userMap = jsonDecode(data.body);
        var APIresult = APIResponse.fromJson(userMap);
        print(APIresult.status);
        print(APIresult.result);
        //GlobalVar.Set("clientdetails", APIresult.result);
        //result = APIresult.result;
        print(APIresult.hasErrors);
        return APIresult;
      } else {
        print('============================');
        print(data.statusCode);
        print("-----------------------------");
      }
      return APIResponse<dynamic>(
          hasErrors: true, messages: "An Error Has Occured");
    }).catchError((_) => APIResponse<dynamic>(
        hasErrors: true, messages: "An Error Has Occured"));
  }

  static Future<APIResponse<dynamic>> MarkClientAsNegative(String clientEmail) {
    print('*****************');
    token = StaticVariables.prefs.getString('token');
    print("Sending MarkClientAsNegative with email: " + clientEmail.replaceAll("@", "%40"));
    String url = StaticVariables.API + 'api/Nurse/MarkClientAsNegative' + '?clientEmail=' + clientEmail;
    return http
        .put(url,
        headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        Map userMap = jsonDecode(data.body);
        var APIresult = APIResponse.fromJson(userMap);
        print(APIresult.status);
        print(APIresult.result);
        //GlobalVar.Set("clientdetails", APIresult.result);
        //result = APIresult.result;
        print(APIresult.hasErrors);
        return APIresult;
      } else {
        print('============================');
        print(data.statusCode);
        print("-----------------------------");
      }
      return APIResponse<dynamic>(
          hasErrors: true, messages: "An Error Has Occured");
    }).catchError((_) => APIResponse<dynamic>(
        hasErrors: true, messages: "An Error Has Occured"));
  }

  //#endregion

  static Future<String> getAccessToken() async {

    String token = StaticVariables.prefs.getString('token');

    return token;
  }
}
