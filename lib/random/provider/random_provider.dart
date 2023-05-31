import 'package:flutter/cupertino.dart';
import 'package:random_api/random/modal/random_modal.dart';
import 'package:random_api/utils/api_helper.dart';

class RandomProvider extends ChangeNotifier {
  RandomModal? randomModal;

  Future<RandomModal?> jsonGet() async {
  randomModal=await ApiHelper.apiHelper.getJson();
  notifyListeners();
  }
}
