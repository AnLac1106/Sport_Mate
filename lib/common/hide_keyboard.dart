import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void hideKeyBoard () {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

void hideKeyBoardAndUnFocus (buildContext, context) {
  FocusScope.of(context).unfocus();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}