import 'package:flutter/material.dart';
import 'package:lekra/services/constants.dart';
import 'package:lekra/views/base/custom_image.dart';

class DemoScanAndPayScreen extends StatelessWidget {
  const DemoScanAndPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppConstants.screenPadding,
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Text(
            "Scan & Pay",
            style: Helper(context).textTheme.titleSmall?.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "Make quick and secure payments by scanning any QR code — fast, simple, and trusted.",
            textAlign: TextAlign.center,
            style: Helper(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomImage(
            path: Assets.imagesScanPay,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
