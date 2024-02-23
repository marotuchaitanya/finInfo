import 'package:fin_project/util_constants/constants.dart';
import 'package:fin_project/util_constants/custom_button.dart';
import 'package:fin_project/views/dogs_view.dart';
import 'package:fin_project/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform = MethodChannel('bluetooth');

  Future<void> enableBluetooth() async {
    try {
      await platform.invokeMethod('enableBluetooth');
      debugPrint('Bluetooth enabled');
    } on PlatformException catch (e) {
      debugPrint('Failed to enable Bluetooth: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Dogs', style: appTitle),
        ),
        drawer: const ProfileView(),
        body: Column(children: [
          /* DOGS VIEW */
          const DogsView(),

          /* TO ENABLE BLUTOOTH */
          CustomElevatedButton(onPressed: enableBluetooth, text: 'Enable Bluetooth'),
        ]),
      ),
    );
  }
}
