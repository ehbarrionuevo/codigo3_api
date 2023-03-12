import 'package:codigo3_api/models/citizen_model.dart';
import 'package:codigo3_api/services/api_service.dart';
import 'package:flutter/material.dart';

class CitizenPage extends StatelessWidget {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ciudadanos"),
      ),
      body: FutureBuilder(
        future: apiService.getCitizens(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<CitizenModel> citizens = snap.data;
            return ListView.builder(
              itemCount: citizens.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(citizens[index].nombreCompleto),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DNI: ${citizens[index].dni}",
                        ),
                        Text(
                          "Teléfono: ${citizens[index].telefono}",
                        ),
                        Text(
                          "Dirección: ${citizens[index].direccion}",
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
