import 'dart:convert';

import 'package:get/get.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/SystemSettings.dart';
import 'package:http/http.dart' as http;

class SystemController extends GetxController {
  Rx<SystemSettings> systemSettings = SystemSettings().obs;
  Rx<bool> isLoading = false.obs;

  final Rx<String> _token = "".obs;

  Rx<String> get token => _token;

  final Rx<String> _schoolId = "".obs;

  Rx<String> get schoolId => _schoolId;

  Future getSystemSettings() async {
    try {
      isLoading(true);
      await getSchoolId().then((value) async {
        print(InfixApi.generalSettings + '/$schoolId');
        final response = await http.get(
            Uri.parse(InfixApi.generalSettings + '/$schoolId'),
            headers: Utils.setHeader(_token.toString()));

        print("response.body ${response.body}");
        if (response.statusCode == 200) {
          final studentRecords = systemSettingsFromJson(response.body);
          systemSettings.value = studentRecords;

          isLoading(false);
        } else {
          // Added by SmartIntel
          Map<String, dynamic> data = jsonDecode(response.body);
          isLoading(false);

          if(data.containsKey("message")){
            throw Exception(data["message"]);
          }
          throw Exception('failed to load');
        }
      });
    } catch (e) {
      isLoading(false);
      print('From e: ${e.toString()}');
      // print('From t: $t');
      throw Exception(e.toString());
    }
  }

  Future getSchoolId() async {
    await Utils.getStringValue('schoolId').then((value) async {
      _schoolId.value = value;
      await Utils.getStringValue('token').then((value) async {
        _token.value = value;
      });
    });
  }

  @override
  void onInit() {
    getSystemSettings();
    super.onInit();
  }
}
