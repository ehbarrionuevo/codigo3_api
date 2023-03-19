import 'dart:convert';
import 'package:codigo3_api/models/news_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:codigo3_api/models/citizen_model.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';

class ApiService {
  Future<List<CitizenModel>> getCitizens() async {
    Uri url = Uri.parse("http://167.99.240.65/API/ciudadanos/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
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

  Future<NewsModel?> registerNews(NewsModel model) async {
    Uri url = Uri.parse("http://167.99.240.65/API/noticias/");
    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      url,
    );

    List<String> mimeData = mime(model.imagen)!.split("/");

    http.MultipartFile image = await http.MultipartFile.fromPath(
      "imagen",
      model.imagen,
      contentType: MediaType(mimeData[0], mimeData[1]),
    );
    request.files.add(image);
    request.fields["titulo"] = model.titulo;
    request.fields["link"] = model.link;
    request.fields["fecha"] = "2023-03-19";

    http.StreamedResponse streamedResponse = await request.send();

    http.Response response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      String dataConvert = const Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
      NewsModel model = NewsModel.fromJson(data);
      return model;
    }
    return null;
  }
}
