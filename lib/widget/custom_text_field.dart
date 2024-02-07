import 'package:crypto_exchange/utility/colors_app.dart';
import 'package:crypto_exchange/utility/sizes_app.dart';
import 'package:crypto_exchange/utility/text_style_source.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final Function onChanged;
  final TextInputType textInputType;
  final bool isValid;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.onChanged,
    this.textInputType = TextInputType.text,
    this.isValid = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isTextTyped = false;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: widget.isValid ? null : Border.all(color: ColorsApp.red),
        color: ColorsApp.grey400,
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH8,
                  Text(
                    widget.title,
                    style: widget.isValid
                        ? TextStyleSource.style12medium.copyWith(
                            color: _isTextTyped
                                ? ColorsApp.grey200
                                : ColorsApp.textGrey)
                        : TextStyleSource.style12medium
                            .copyWith(color: ColorsApp.red),
                  ),
                  gapH4,
                  TextField(
                    cursorColor: ColorsApp.grey100,
                    style: const TextStyle(color: ColorsApp.grey100),
                    keyboardType: widget.textInputType,
                    obscureText: widget.textInputType == TextInputType.text
                        ? _isObscure
                        : false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyleSource.style16regular.copyWith(
                        color: ColorsApp.textGrey,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _isTextTyped = value.isNotEmpty;
                      });
                      widget.onChanged(value);
                    },
                  ),
                  gapH8,
                ],
              ),
            ),
            Visibility(
              visible: widget.textInputType == TextInputType.text,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                visualDensity: const VisualDensity(horizontal: -4),
                padding: EdgeInsets.zero,
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: ColorsApp.accent,
                ),
              ),
            ),
            // SvgPicture.asset(ImageSVGApp.hiddenPassword),
          ],
        ),
      ),
    );
  }
}
