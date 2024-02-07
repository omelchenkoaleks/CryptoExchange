import 'package:crypto_exchange/utility/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageButton extends StatelessWidget {
  final String imagePath;
  final Function onTap;

  const CustomImageButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorsApp.transparent,
        ),
        child: SvgPicture.asset(imagePath),
      ),
    );
  }
}
