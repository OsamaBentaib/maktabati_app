import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maktabati/app/helpers/localData.dart';
import 'package:maktabati/constants.dart';

TeacherDashboardLocalData localdata = TeacherDashboardLocalData();

class APIConnect {
  Future<dynamic> getSchoolTypes() async {
    print("connected!!");
    const String end_point = "/school-type/";
    final url = proxy_url + end_point;
    print(url);
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  Future<String> getCitiesLists() async {
    const String end_point = "/cities/null/";
    final url = proxy_url + end_point;
    print(url);
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  Future<String> getSchoolsLists() async {
    const String end_point = "/schools/";
    final url = proxy_url + end_point;
    print(url);
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /*
  *=====================
  *  TEACHER ACCESS
  *=====================
  */
  Future<dynamic> onTryToAccess(data) async {
    const String end_point = "/teacher-access/";

    final url = proxy_url + end_point;
    print(url);
    final body = json.encode(data);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    print(response.body);
    return response;
  }

  Future<dynamic> createTeacherProfile(data) async {
    final read = await localdata.read("teacher-access");
    Map<String, dynamic> token = jsonDecode(jsonDecode(read));
    const String end_point = "/teacher-create/";
    final url = proxy_url + end_point;
    final request = <String, String>{
      "city": data['city'],
      "school": data['school'],
      "teacher": token['_id']
    };
    final body = json.encode(request);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token['token'],
      },
      body: body,
    );
    print(response.body);
    print(response.statusCode);
    return response;
  }

  Future<dynamic> onTryToVerify(data) async {
    const String end_point = "/phone-verify/";
    final url = proxy_url + end_point;
    final body = json.encode(data);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    return response;
  }

  /*
  *=====================
  *  TEACHER Dashboard
  *=====================
  */
  Future<dynamic> getTeacherDashboard() async {
    final read = await localdata.read("teacher-access");
    Map<String, dynamic> token = jsonDecode(jsonDecode(read));
    final String id = token['_id'];
    final String end_point = "/school-supplies/teacher/$id/";
    final url = proxy_url + end_point;
    print(url);
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token['token'],
      },
    );
    return response;
  }

  Future<dynamic> createNewSchoolSupplies(data) async {
    final read = await localdata.read("teacher-access");
    Map<String, dynamic> token = jsonDecode(jsonDecode(read));
    const String end_point = "/school-supplies/";
    final url = proxy_url + end_point;
    final body = jsonEncode(data);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token['token'],
      },
      body: body,
    );
    return response;
  }

  Future<dynamic> getTeacherLevel() async {
    final read = await localdata.read("teacher-access");
    Map<String, dynamic> token = jsonDecode(jsonDecode(read));
    final String id = token['_id'];
    final String end_point = "/school-type/teacher/$id/";
    final url = proxy_url + end_point;
    print(url);
    print(token);
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token['token'],
      },
    );
    return response;
  }
}
