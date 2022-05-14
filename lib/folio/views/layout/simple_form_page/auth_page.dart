import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_folio/core_packages.dart';
import 'package:sized_context/sized_context.dart';

import 'device_screens.dart';

class SimpleFormPage extends StatelessWidget {
  const SimpleFormPage({Key? key, required this.formWidget}) : super(key: key);
  final Widget formWidget;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // This view will switch from row/col based on available width
    bool useVerticalLayout = context.widthPx < 700;
    // Calculate how wide or tall we want the form to be. Use golden ratio for nice aesthetics.
    double formWidth = max(500, context.widthPx * .382);
    double formHeight = max(500, context.heightPx * .382);
    // When we don't have enough vertical height, and are in portrait mode, we need to hide the devices.
    bool hideDevices = useVerticalLayout && context.heightPx < formHeight + 150;
    Color formBgColor = useVerticalLayout ? theme.scaffoldBackgroundColor : theme.colorScheme.surface;
    return Container(
      color: formBgColor,
      child: Flex(
        // Switch from row to column when in portrait mode
        direction: useVerticalLayout ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hideDevices) ...[
            // If just showing the form, let it flex
            Flexible(child: formWidget),
          ] else ...[
            // Let the device screen be flexible
            Flexible(child: DeviceScreens(useVerticalLayout)),
            SizedBox(width: formWidth, height: formHeight, child: formWidget),
          ]
        ],
      ),
    );
  }
}