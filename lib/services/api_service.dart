import 'dart:convert';

import 'package:codigo3_api/models/citizen_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<CitizenModel>> getCitizens() async {
    Uri url = Uri.parse("http://167.99.240.65/API/ciudadanos/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List dataList = data["data"];
      List<CitizenModel> citizens =
          dataList.map((e) => CitizenModel.fromJson(e)).toList();
      return citizens;
    }
    return [];
  }
}
