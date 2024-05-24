// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.selected = false});
  String text;
  final void Function()? onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 5, right: 8, bottom: 5, left: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        // height: 20,
        width: 70,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
