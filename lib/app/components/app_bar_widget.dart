import 'package:flutter/material.dart';
import 'package:infinitum/app/core/app_images.dart';
import 'package:infinitum/app/core/app_text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: Container(
        height: 150,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Colors.deepPurple.shade900),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Inifinitum APP",
              style: AppTextStyles.title,
            ),
            Container(
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
