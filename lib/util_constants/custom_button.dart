import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomElevatedButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          disabledForegroundColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          fixedSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.03),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, inherit: false, fontWeight: FontWeight.bold),
      ),
    );
  }
}
