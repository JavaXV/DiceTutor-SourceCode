import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  stdout.writeln('What is the present year?');
  String? userInput = stdin.readLineSync();
  debugPrint("Your Answer is $userInput");
}
