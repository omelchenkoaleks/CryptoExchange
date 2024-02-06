import 'package:crypto_exchange/utility/colors_app.dart';
import 'package:crypto_exchange/utility/sizes_app.dart';
import 'package:crypto_exchange/utility/text_style_source.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final Function onChanged;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isTextTyped = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.grey400,
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH8,
            Text(
              widget.title,
              style: TextStyleSource.style12medium.copyWith(
                color: isTextTyped ? ColorsApp.grey200 : ColorsApp.textGrey,
              ),
            ),
            gapH4,
            TextField(
              controller: widget.controller,
              cursorColor: ColorsApp.grey100,
              style: const TextStyle(color: ColorsApp.grey100),
              decoration: InputDecoration.collapsed(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyleSource.style16regular.copyWith(
                  color: ColorsApp.textGrey,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  isTextTyped = value.isNotEmpty;
                });
                widget.onChanged(value);
              },
            ),
            gapH8,
          ],
        ),
      ),
    );
  }
}
