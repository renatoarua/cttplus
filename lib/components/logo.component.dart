import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  final double width;

  const LogoComponent({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width),
        image: const DecorationImage(
          image: NetworkImage('../assets/images/logo.png'),
        ),
        color: Colors.black.withOpacity(.2),
        border: Border.all(
          width: 5,
          color: Colors.white.withOpacity(.5),
        ),
      ),
    );
  }
}
