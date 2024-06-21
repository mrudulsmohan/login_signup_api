import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup_api/models/login_response.dart';
import 'dart:convert';

import 'package:login_signup_api/newpage.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<LoginResponse?> login(String emailOrPhone, String password) async {
    isLoading(true);
    const url = 'https://slava.erebs.in/api/v2/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"password": password, "mobile_number": emailOrPhone}),
    );
    isLoading(false);

    if (emailOrPhone.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'failed to login',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return null;
    }

    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (responseData['status_code'] == '01') {
        Get.to(() => Newpage());
      }
    } else {
      if (responseData['status_code'] == '00') {
        Get.snackbar(
          'Error',
          responseData['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    }

    return null;
  }
}
