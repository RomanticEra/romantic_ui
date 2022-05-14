import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:romantic_ui/folio/views/layout/simple_form_page/auth_page.dart';

void main() {
  // runApp(const MyApp());
  runApp(ProviderScope(
    child: AuthPage(
      formWidget: Container(
        height: 200,
        width: 200,
      ),
    ),
  ));
}
