import 'package:flutter/material.dart';
import 'package:lekra/services/constants.dart';
import 'package:lekra/services/theme.dart';
import 'package:lekra/views/base/custom_image.dart';
import 'package:lekra/views/screens/widget/button/common_button.dart';

class AuthHomeScreen extends StatelessWidget {
  const AuthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppConstants.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 🔹 Centered logo + text
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImage(
                      path: Assets.imagesLogo,
                      height: 118,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Welcome to ${AppConstants.appName}",
                      textAlign: TextAlign.center,
                      style: Helper(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),

            // 🔹 Bottom button
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 40), // add spacing from bottom
              child: Column(
                children: [
                  CommonButton(title: "CREATE YOUR ACCOUNT", onPressed: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: grey)),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              white, // ✅ Use custom background color
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          side: BorderSide(color: grey)),
                      onPressed: () {},
                      child: Text(
                        "LOG INTO YOUR ACCOUNT", // ✅ Use dynamic title
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: black, // ✅ Use dynamic text color
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
