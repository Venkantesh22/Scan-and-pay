import 'package:flutter/material.dart';
import 'package:lekra/services/constants.dart';
import 'package:lekra/views/base/custom_image.dart';

class DemoSecureTransactionsScreen extends StatelessWidget {
  const DemoSecureTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppConstants.screenPadding,
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              'Secure Transactions',
              style: Helper(context).textTheme.titleSmall?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Your financial safety is our top priority. We use advanced encryption to protect your transactions.',
              textAlign: TextAlign.center,
              style: Helper(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(
              height: 28,
            ),
            CustomImage(
              path: Assets.imagesSecureTranscaion,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
              radius: 6,
            )
          ],
        ),
      ),
    );
  }
}
