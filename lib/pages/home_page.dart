import 'package:codigo3_api/pages/citizen_page.dart';
import 'package:codigo3_api/pages/register_page.dart';
import 'package:codigo3_api/widgets/item_home_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "API General",
              ),
              ItemHomeWidget(
                title: "Registrar Ciudadano",
                subtitle: "Módulo del ciudadano",
                toPage: const RegisterPage(),
              ),
              ItemHomeWidget(
                title: "Iniciar Sesión Ciudadano",
                subtitle: "Módulo del ciudadano",
                toPage: const RegisterPage(),
              ),
              ItemHomeWidget(
                title: "Listar Ciudadanos",
                subtitle: "Módulo del ciudadano",
                toPage: CitizenPage(),
              ),
              const Divider(),
              ItemHomeWidget(
                title: "Registrar Incidentes",
                subtitle: "Módulo de incidentes",
                toPage: const RegisterPage(),
              ),
              ItemHomeWidget(
                title: "Listado de Incidentes",
                subtitle: "Módulo de incidentes",
                toPage: const RegisterPage(),
              ),
              const Divider(),
              ItemHomeWidget(
                title: "Registrar Noticias",
                subtitle: "Módulo de noticias",
                toPage: const RegisterPage(),
              ),
              ItemHomeWidget(
                title: "Listado de Noticias",
                subtitle: "Módulo de noticias",
                toPage: const RegisterPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
