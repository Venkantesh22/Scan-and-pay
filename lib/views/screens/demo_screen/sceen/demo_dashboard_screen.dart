import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lekra/controllers/basic_controller.dart';
import 'package:lekra/services/constants.dart';
import 'package:lekra/services/theme.dart';
import 'package:lekra/views/screens/auth_screens/auth_home_screen/auth_home_screen.dart';
import 'package:lekra/views/screens/demo_screen/components/cirlce_widget.dart';
import 'package:lekra/views/screens/demo_screen/sceen/demo_save_money.dart';
import 'package:lekra/views/screens/demo_screen/sceen/demo_scan_and_pay_screen.dart';
import 'package:lekra/views/screens/demo_screen/sceen/demo_secure_transactions.dart';
// ✅ import your actual Home page

class DemoDashboardScreen extends StatefulWidget {
  const DemoDashboardScreen({super.key});

  @override
  State<DemoDashboardScreen> createState() => _DemoDashboardScreenState();
}

class _DemoDashboardScreenState extends State<DemoDashboardScreen> {
  final PageController _pageController = PageController();

  final List<Widget> pages = const [
    DemoSaveMoneyScreen(),
    DemoSecureTransactionsScreen(),
    DemoScanAndPayScreen(),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BasicController>().demoPageSet = 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext(BasicController controller) {
    if (controller.demoPage < pages.length - 1) {
      controller.demoPageSet = controller.demoPage + 1;
      _pageController.animateToPage(
        controller.demoPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // ✅ Navigate to home after last page
      navigate(context: context, page: AuthHomeScreen(), isRemoveUntil: true);
    }
  }

  void _onSkip() {
    // ✅ Skip button goes directly to home page
    navigate(context: context, page: AuthHomeScreen(), isRemoveUntil: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Stack to overlay skip button on top of pages
      body: Stack(
        children: [
          GetBuilder<BasicController>(
            builder: (controller) {
              return PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  controller.demoPageSet = index;
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: pages[index],
                ),
              );
            },
          ),

          // 🔹 Skip Button (Top Right)
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 20),
                child: TextButton(
                  onPressed: _onSkip,
                  style: TextButton.styleFrom(
                    foregroundColor: primaryColor,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text("Skip"),
                ),
              ),
            ),
          ),
        ],
      ),

      // 🔹 Bottom Indicators + NEXT Button
      bottomNavigationBar: SafeArea(
        child: GetBuilder<BasicController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Circle indicators
                  Row(
                    children: List.generate(
                      pages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircleWidget(
                          isSelect: controller.demoPage == index,
                        ),
                      ),
                    ),
                  ),

                  // NEXT / DONE button
                  GestureDetector(
                    onTap: () => _onNext(controller),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 49,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        controller.demoPage < pages.length - 1
                            ? "NEXT"
                            : "DONE",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lekra/controllers/basic_controller.dart';
// import 'package:lekra/services/constants.dart';
// import 'package:lekra/services/theme.dart';
// import 'package:lekra/views/screens/auth_screens/auth_home_screen/auth_home_screen.dart';
// import 'package:lekra/views/screens/demo_screen/components/cirlce_widget.dart';
// import 'package:lekra/views/screens/demo_screen/sceen/demo_save_money.dart';
// import 'package:lekra/views/screens/demo_screen/sceen/demo_scan_and_pay_screen.dart';
// import 'package:lekra/views/screens/demo_screen/sceen/demo_secure_transactions.dart';

// class DemoDashboardScreen extends StatefulWidget {
//   const DemoDashboardScreen({super.key});

//   @override
//   State<DemoDashboardScreen> createState() => _DemoDashboardScreenState();
// }

// class _DemoDashboardScreenState extends State<DemoDashboardScreen> {
//   late final PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     // Ensure controller is available
//     final controller = Get.isRegistered<BasicController>()
//         ? Get.find<BasicController>()
        
//     _pageController = PageController(initialPage: controller.demoPage);
//   }

//   final List<Widget> pages = const [
//     DemoSaveMoneyScreen(),           // <-- NOTE: not a Scaffold
//     DemoSecureTransactionsScreen(),// <-- ensure this isn't a Scaffold either
//     DemoScanAndPayScreen(),        // <-- same here
//   ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _onNext(BasicController controller) {
//     if (controller.demoPage < pages.length - 1) {
//       controller.demoPageSet = controller.demoPage + 1;
//       _pageController.animateToPage(
//         controller.demoPage,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       navigate(context: context, page: AuthHomeScreen(), isRemoveUntil: true);
//     }
//   }

//   void _onSkip() {
//     navigate(context: context, page: AuthHomeScreen(), isRemoveUntil: true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GetBuilder<BasicController>(
//             init: Get.isRegistered<BasicController>()
//                 ? null
//                 : BasicController(),
//             builder: (controller) {
//               return PageView.builder(
//                 controller: _pageController,
//                 itemCount: pages.length,
//                 onPageChanged: (index) => controller.demoPageSet = index,
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 15,
//                   ),
//                   child: pages[index],
//                 ),
//               );
//             },
//           ),
//           // Skip
//           SafeArea(
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 12, right: 20),
//                 child: TextButton(
//                   onPressed: _onSkip,
//                   style: TextButton.styleFrom(
//                     foregroundColor: primaryColor,
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   child: const Text("Skip"),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: SafeArea(
//         child: GetBuilder<BasicController>(
//           builder: (controller) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // indicators
//                   Row(
//                     children: List.generate(
//                       pages.length,
//                       (index) => Padding(
//                         padding: const EdgeInsets.only(right: 8),
//                         child: CircleWidget(
//                           isSelect: controller.demoPage == index,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // next / done
//                   GestureDetector(
//                     onTap: () => _onNext(controller),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 49,
//                         vertical: 14,
//                       ),
//                       decoration: BoxDecoration(
//                         color: primaryColor,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Text(
//                         controller.demoPage < pages.length - 1 ? "NEXT" : "DONE",
//                         style: Helper(context).textTheme.bodyMedium?.copyWith(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w700,
//                               color: white,
//                             ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
