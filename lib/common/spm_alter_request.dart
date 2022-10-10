// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sport_mate/common/spm_button.dart';
// import 'package:sport_mate/common/spm_colors.dart';
// import 'package:sport_mate/spm_newfeed_page.dart';

// void AlterRequest() {
//   Get.dialog(AlertDialog(
//     title: const Text('Send request?'),
//     content: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const [
//         Text(
//           'Send request to this game?',
//           style: TextStyle(fontSize: 16),
//         ),
//       ],
//     ),
//     actionsAlignment: MainAxisAlignment.center,
//     actions: [
//       SPMButton(
//         color: SPMColors.primaryColor,
//         onPress: () {
//           // Get.back();
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => const SPMNewFeedPage()),
//               (route) => false);
//           Get.snackbar(
//             'Success!',
//             'Your request have been sent',
//             backgroundColor: Colors.orange.shade100,
//             snackPosition: SnackPosition.BOTTOM,
//             duration: const Duration(seconds: 2),
//           );
//         },
//         borderColor: SPMColors.primaryColor,
//         child: const Text('OK'),
//       ),
//       SPMButton(
//         color: Colors.white,
//         onPress: () {
//           Get.back();
//         },
//         child: const Text('Cancel'),
//       ),
//     ],
//   ));
// }
