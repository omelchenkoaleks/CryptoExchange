import 'package:crypto_exchange/utility/colors_app.dart';
import 'package:crypto_exchange/utility/sizes_app.dart';
import 'package:crypto_exchange/utility/text_style_source.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color colorButton;
  final Color colorText;
  final double elevation;
  final Function onTap;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.colorButton = ColorsApp.accent,
    this.colorText = ColorsApp.grey400,
    this.elevation = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultHeightPrimaryButton,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: colorButton,
          foregroundColor: colorText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p8),
          ),
        ),
        onPressed: () => onTap(),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyleSource.style16semibols,
        ),
      ),
    );
  }
}
