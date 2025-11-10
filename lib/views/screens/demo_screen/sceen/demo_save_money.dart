import 'package:flutter/material.dart';
import 'package:lekra/services/constants.dart';
import 'package:lekra/views/base/custom_image.dart';

class DemoSaveMoneyScreen extends StatelessWidget {
  const DemoSaveMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppConstants.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomImage(
              path: Assets.imagesSaveMoney,
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Save money",
              style: Helper(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "We help you meet your savings target monthly and our emergency plans enable you save for multiple purposes",
              style: Helper(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 17, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
