import 'package:fin_project/services/image_services.dart';
import 'package:fin_project/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImageUrlService imageServices = ImageUrlService();
  List<String> images = [];

  static const platform = MethodChannel('bluetooth');

  Future<void> enableBluetooth() async {
    try {
      await platform.invokeMethod('enableBluetooth');
      print('Bluetooth enabled');
    } on PlatformException catch (e) {
      print('Failed to enable Bluetooth: ${e.message}');
    }
  }

  @override
  void initState() {
    imageServices.getImageData().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // leading: const ProfileView(),
      ),
      drawer: const ProfileView(),
      body: Column(children: [
        SizedBox(
          width: 500,
          height: 600,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: imageServices.imageUrl.length,
            itemBuilder: (context, index) {
              return Image.network(
                imageServices.imageUrl[index],
                cacheHeight: 400,
                cacheWidth: 500,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null ? child : const CircularProgressIndicator();
                },
              );
            },
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
              imageServices.getImageData();
              setState(() {});
            },
            child: const Text('Refresh To Load Images')),
        ElevatedButton(
          onPressed: () {
            enableBluetooth();
          },
          child: const Text('Enable Bluetooth'),
        ),
      ]),
    );
  }
}
