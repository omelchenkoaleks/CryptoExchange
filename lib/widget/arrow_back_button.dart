import 'package:crypto_exchange/utility/image_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          ImageSVGApp.arrowLeft,
        ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
