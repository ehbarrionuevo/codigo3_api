import 'package:codigo3_api/models/citizen_model.dart';
import 'package:codigo3_api/services/api_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Ciudadano"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: "Ingresa tu nombre completo",
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: _dniController,
                decoration: InputDecoration(
                  hintText: "Ingresa tu DNI",
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "Ingresa tu teléfono",
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: "Ingresa tu dirección",
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Ingresa tu contraseña",
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    ApiService apiService = ApiService();
                    CitizenModel model = CitizenModel(
                      id: 0,
                      nombreCompleto: _fullNameController.text,
                      telefono: _phoneController.text,
                      direccion: _addressController.text,
                      dni: _dniController.text,
                      calificacion: 0,
                      estado: "",
                    );
                    apiService.registerCitizen(model);
                  },
                  child: Text(
                    "Registrar",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
