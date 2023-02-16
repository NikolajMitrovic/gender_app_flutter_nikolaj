import 'dart:convert';

import 'package:http/http.dart';

import '../_all.dart';

class UserRepository {
  String baseApiUrl = 'fakerapi.it';
  String endpoint = '/api/v1/users';
  Future<List<UserModel>>? getGender({int? quantity = 10, String? gender}) async {
    quantity ??= 10;

    // print(
    //   Uri.http(baseApiUrl, endpoint, {'_quantity': '$quantity', '_gender': '$gender'}),
    // );

    Response response = await get(
      Uri.http(baseApiUrl, endpoint, {'_quantity': '$quantity', '_gender': '$gender'}),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result
          .map(
            (e) => UserModel.fromJson(e),
          )
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
