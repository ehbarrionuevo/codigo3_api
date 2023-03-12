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

  registerCitizen(CitizenModel model) async {
    Uri url = Uri.parse("http://167.99.240.65/API/registro/");
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {
          "nombreCompleto": model.nombreCompleto,
          "dni": model.dni,
          "telefono": model.telefono,
          "direccion": model.direccion,
          "password": "mandarina"
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      print("Registro exitoso");
    }
  }
}
