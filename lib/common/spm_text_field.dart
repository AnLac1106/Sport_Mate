// import 'package:final_project/common/text_style_project.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class TextFieldProject extends StatelessWidget {
//   final TextEditingController? controller;
//   final TextInputType keyboardType;
//   final TextCapitalization textCapitalization;
//   final String? labelText;
//   final String? hintText;
//   final bool autoFocus;
//   final bool obscureText;
//   final bool enable;
//   final bool readOnly;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final List<TextInputFormatter>? inputFormatters;
//   final int minLines;
//   final int maxLines;
//   final TextAlign textAlign;
//   final double? letterSpacing;
//   final TextInputAction? textInputAction;
//   final Function(String)? onChanged;
//   final Function(String)? onSubmitted;

//   const TextFieldProject({
//     Key? key,
//     this.controller,
//     this.autoFocus = false,
//     this.obscureText = false,
//     this.enable = true,
//     this.readOnly = false,
//     this.keyboardType = TextInputType.text,
//     this.textCapitalization = TextCapitalization.words,
//     this.labelText,
//     this.hintText,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.inputFormatters,
//     this.minLines = 1,
//     this.maxLines = 1,
//     this.textAlign = TextAlign.left,
//     this.letterSpacing,
//     this.textInputAction,
//     this.onChanged,
//     this.onSubmitted,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Visibility(
//           visible: labelText != null,
//           child: Container(
//             margin: const EdgeInsets.only(bottom: 4),
//             child: Text(
//               labelText ?? '',
//               style: textStyleHeading4,
//             ),
//           ),
//         ),
//         TextField(
//           controller: controller,
//           autofocus: autoFocus,
//           autocorrect: false,
//           obscureText: obscureText,
//           enabled: enable,
//           readOnly: readOnly,
//           keyboardType: keyboardType,
//           textCapitalization: textCapitalization,
//           inputFormatters: inputFormatters,
//           minLines: minLines,
//           maxLines: minLines > maxLines ? minLines : maxLines,
//           textAlign: textAlign,
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//             color: Colors.black87,
//             letterSpacing: letterSpacing,
//           ),
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: textStyleNormal,
//             // border: OutlineInputBorder(
//             //   borderRadius: BorderRadius.circular(8),
//             // ),
//             // enabledBorder: OutlineInputBorder(
//             //   borderSide: const BorderSide(color: Colors.grey),
//             //   borderRadius: BorderRadius.circular(8),
//             // ),
//             // disabledBorder: OutlineInputBorder(
//             //   borderSide: const BorderSide(color: Colors.grey),
//             //   borderRadius: BorderRadius.circular(8),
//             // ),
//             // focusedBorder: OutlineInputBorder(
//             //   borderSide: const BorderSide(color: Colors.grey),
//             //   borderRadius: BorderRadius.circular(8),
//             // ),
//             isCollapsed: kIsWeb ? false : true,
//             isDense: true,
//             fillColor: Colors.white,
//             filled: true,
//             contentPadding: EdgeInsets.fromLTRB(
//               prefixIcon != null ? 0 : 16,
//               15,
//               suffixIcon != null ? 0 : 16,
//               15,
//             ),
//             prefixIcon: prefixIcon,
//             suffixIcon: suffixIcon,
//           ),
//           textAlignVertical: TextAlignVertical.center,
//           textInputAction: textInputAction,
//           onChanged: onChanged,
//           onSubmitted: onSubmitted,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'spm_text_style.dart';

class SPMTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const SPMTextField({
    Key? key,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buildController = TextEditingController();
    return TextField(
      onChanged: onChanged,
      controller: buildController,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: textStyleHeading4,
        hintText: hintText,
        suffixIcon: buildController.text.isEmpty
            ? IconButton(
                onPressed: () {
                  return buildController.clear();
                },
                icon: const Icon(Icons.close),
              )
            : Container(width: 0),
      ),
    );
  }
}
