import 'dart:ui';

import 'package:flutter/material.dart';

class SPMTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType keyBoardType;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final int? maxLine;
  final int minLine;
  final FocusNode? focusNode;
  final TextStyle? labelStyle;
  final bool expands;

  const SPMTextField(
      {super.key,
      this.labelText,
      this.hintText,
      this.keyBoardType = TextInputType.text,
      this.controller,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.textCapitalization = TextCapitalization.words,
      this.onChanged,
      this.maxLine,
      this.minLine = 1,
      this.suffix,
      this.focusNode,
      this.labelStyle,
      this.expands = false});

  @override
  State<SPMTextField> createState() => _SPMTextFieldState();

  copyWith() {}
}

class _SPMTextFieldState extends State<SPMTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      selectionHeightStyle: BoxHeightStyle.tight,
      textAlignVertical: TextAlignVertical.top,
      focusNode: widget.focusNode,
      style: const TextStyle(fontSize: 18, height: 1.5),
      onChanged: widget.onChanged,
      textCapitalization: widget.textCapitalization,
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyBoardType,
      maxLines: widget.maxLine,
      minLines: widget.minLine,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        isDense: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffix,
        labelText: widget.labelText,
        // labelStyle: Get.textTheme.headline4,
        hintText: widget.hintText,

        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.blue),
        //   borderRadius: BorderRadius.circular(10),
        // ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'spm_text_style.dart';
//
// class SPMTextField extends StatelessWidget {
//   final Function(String)? onChanged;
//   final String? labelText;
//   final String? hintText;
//   final TextInputType? keyboardType;
//   final Widget? suffixIcon;
//
//   const SPMTextField({
//     Key? key,
//     this.onChanged,
//     this.labelText,
//     this.hintText,
//     this.keyboardType,
//     this.suffixIcon,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final buildController = TextEditingController();
//     return TextField(
//       onChanged: onChanged,
//       controller: buildController,
//       keyboardType: keyboardType,
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: textStyleHeading4,
//         hintText: hintText,
//         suffixIcon: buildController.text.isEmpty
//             ? IconButton(
//                 onPressed: () {
//                   return buildController.clear();
//                 },
//                 icon: const Icon(Icons.close),
//               )
//             : Container(width: 0),
//       ),
//     );
//   }
// }
