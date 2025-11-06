import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../services/constants.dart';
import '../../base/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

//    Get.find<BasicController>().fetchSettings().then((value) async {
//       if (value.isSuccess) {
//         PackageInfo info = await PackageInfo.fromPlatform();
//         log(info.buildNumber, name: 'Build Number');
//         log(info.version, name: 'Version');

//         if ((Platform.isIOS ? Get.find<BasicController>().settings?.iosAppVersion : Get.find<BasicController>().settings?.appVersion).toInt > info.buildNumber.toInt) {
//           if (!mounted) return;
//           await showUpdateDialogue(
//             context: context,
//             skip: (Platform.isAndroid
//                 ? (Get.find<BasicController>().settings?.forceUpdate != 'on')
//                 : (Get.find<BasicController>().settings?.iosForceUpdate != 'on')),
//           );
//         } else if ((Platform.isAndroid ? Get.find<BasicController>().settings?.maintenanceMode : Get.find<BasicController>().settings?.iosMaintenanceMode) == 'on') {
//           if (!mounted) return;
//           await showMaintenanceDialog(
//             context: context,
//           );
//         }

//         // Without Login Explore
//         Timer(const Duration(seconds: 2), () {
//           if (Get.find<AuthController>().isLoggedIn()) Get.find<AuthController>().getUserProfileData();
//           if (Get.find<SharedPreferences>().getBool(AppConstants.isFirstVisit) ?? true) {
//             Navigator.pushReplacement(
//               context,
//               getCustomRoute(
//                 child: const IntroScreen(),
//               ),
//             );
//           } else {
//             Navigator.pushReplacement(
//               context,
//               getCustomRoute(
//                 child: const DashboardScreen(),
//               ),
//             );
//           }
//         });

//       } else {
//         showCustomToast(msg: value.data?.toString() ?? 'Something Went Wrong');
//       }
//     });

    Timer.run(() {
      Future.delayed(const Duration(seconds: 2), () {});
      /*if (Get.find<AuthController>().isLoggedIn()) {
        Get.find<AuthController>().getUserProfileData().then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            if (Get.find<AuthController>().checkUserData()) {
              Navigator.pushReplacement(
                context,
                getMaterialRoute(
                  child: const Dashboard(),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                getMaterialRoute(
                  child: const SignupScreen(),
                ),
              );
            }
          });
        });
      } else {
        Navigator.pushReplacement(
          context,
          getMaterialRoute(
            child: const LoginScreen(),
          ),
        );
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomImage(
              path: Assets.imagesSuitcase,
              height: 38,
              width: 40,
              fit: BoxFit.cover,
            ),

            Text(
              AppConstants.appName,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.manrope().fontFamily),
            ),
            // Text(
            //   "Subtitle",
            //   style: Theme.of(context).textTheme.bodyMedium,
            // ),
          ],
        ),
      ),
    );
  }
}
