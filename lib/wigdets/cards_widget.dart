import 'package:flutter/material.dart';

const Color _firstColor = Color(0xfff4f4f8);
const Color _secondColor = Color(0xff031926);

class HomeCard extends StatelessWidget {
  final String text;
  final Function() onTap;

  const HomeCard({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: _secondColor,
          ),
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center, // center align the text
          child: Text(
            text,
            style: const TextStyle(
              color: _firstColor,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
