import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_api/random/modal/random_modal.dart';
class ApiHelper
{
  static ApiHelper apiHelper=ApiHelper();

  String link='https://randomuser.me/api/';
  RandomModal randomModal =RandomModal();
  Future<RandomModal> getJson()
  async {
    var response =await http.get(Uri.parse(link));
    var json=jsonDecode(response.body);
    randomModal=RandomModal.fromJson(json);
    print(response.body);
    return randomModal;
  }
}