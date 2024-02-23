import 'package:fin_project/services/image_services.dart';
import 'package:fin_project/util_constants/custom_button.dart';
import 'package:fin_project/util_constants/custom_raw_scroll.dart';
import 'package:flutter/material.dart';

class DogsView extends StatefulWidget {
  const DogsView({super.key});

  @override
  State<DogsView> createState() => _DogsViewState();
}

class _DogsViewState extends State<DogsView> {
  ImageUrlService imageServices = ImageUrlService();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    imageServices.getImageData().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* IMAGE RENDERING */
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          child: CustomRawScrollBar(
            controller: scrollController,
            color: Colors.white,
            padding: const EdgeInsets.only(top: 15),
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              controller: scrollController,
              shrinkWrap: true,
              itemCount: imageServices.imageUrl.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.white, width: 2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageServices.imageUrl[index],
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null ? child : const CircularProgressIndicator();
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        /* REFRESH TO LOAD IMAGES */
        CustomElevatedButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
              imageServices.getImageData();
              setState(() {});
            },
            text: 'Refresh To Load Images'),
      ],
    );
  }
}
