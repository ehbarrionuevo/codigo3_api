import 'dart:collection';
import 'dart:io';

import 'package:codigo3_api/models/news_model.dart';
import 'package:codigo3_api/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';

class RegisterNews extends StatefulWidget {
  @override
  State<RegisterNews> createState() => _RegisterNewsState();
}

class _RegisterNewsState extends State<RegisterNews> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  XFile? imagex;

  getImageGallery() async {
    imagex = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagex != null) {
      setState(() {});
    }
    // print(await image!.length());
    // print(await image.path);
    // File myFile = File(image!.path);
    // print(myFile.lengthSync());
  }

  getImageCamera() async {
    imagex = await imagePicker.pickImage(source: ImageSource.camera);
    if (imagex != null) {
      setState(() {});
    }
  }

  registerNews() async {
    ApiService apiService = ApiService();
    if (imagex != null) {
      File newImage =
          await FlutterNativeImage.compressImage(imagex!.path, quality: 90);
      NewsModel news = NewsModel(
        id: 0,
        link: linkController.text,
        titulo: titleController.text,
        fecha: DateTime.now(),
        imagen: newImage.path,
      );
      apiService.registerNews(news);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Noticias"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Ingresa un título",
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: linkController,
                decoration: InputDecoration(
                  hintText: "Ingresa un link",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        getImageGallery();
                      },
                      icon: Icon(Icons.image),
                      label: Text("Galería"),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        getImageCamera();
                      },
                      icon: Icon(Icons.image),
                      label: Text("Cámara"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              imagex != null
                  ? Image.file(
                      File(imagex!.path),
                      height: 230,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    registerNews();
                  },
                  child: Text("Registrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
