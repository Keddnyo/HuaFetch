import 'package:flutter/services.dart';

void copyText(String text) => Clipboard.setData(
      ClipboardData(text: text),
    );
