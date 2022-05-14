import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:romantic_ui/folio/model/styles.dart';

import 'package:romantic_ui/folio/views/widget/gradient_container.dart';
import 'package:romantic_ui/folio/views/widget/animated/animated_scale.dart' as folio;

class DeviceScreens extends ConsumerWidget {
  const DeviceScreens(this.portraitMode, {Key? key}) : super(key: key);
  final bool portraitMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        ClipRRect(
          child: Container(
            color: theme.scaffoldBackgroundColor,
            width: double.infinity,
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (_, constraints) {
                double offsetX = 0;
                // Define a minWidth for each aspect ratio, below this we'll offset the content on the hz axis to center it
                double width = portraitMode ? 600 : 1200;
                if (constraints.maxWidth < width) offsetX = -(width - constraints.maxWidth) / 2;
                // Create the stack of images, top-left aligned with hard-coded sizes to keep it simple
                List<Widget> images;
                if (portraitMode) {
                  images = [
                    _LandingPageImage("dashedLine-mobile.png", const Offset(80, 0), height: 450, scaleOnHover: false),
                    _LandingPageImage("tablet.png", const Offset(-50, 30), height: 200),
                    _LandingPageImage("web.png", const Offset(180, 350), height: 400),
                    _LandingPageImage("phone.png", const Offset(0, 250), height: 260),
                    _LandingPageImage("laptop.png", const Offset(220, 40), height: 250),
                  ];
                } else {
                  images = [
                    _LandingPageImage("dashedLine-desktop.png", const Offset(180, -400),
                        height: 1300, scaleOnHover: false),
                    _LandingPageImage("tablet.png", const Offset(0, 50), height: 350),
                    _LandingPageImage("phone.png", const Offset(50, 500), height: 650),
                    _LandingPageImage("web.png", const Offset(440, 600), height: 500),
                    _LandingPageImage("laptop.png", const Offset(550, 100), height: 400),
                  ];
                }
                return Transform.translate(
                  offset: Offset(offsetX, 0),
                  child: SizedBox(
                    width: width,
                    child: Stack(clipBehavior: Clip.none, children: images),
                  ),
                );
              },
            ),
          ),
        ),
        if (portraitMode) ...[
          Align(
            alignment: Alignment.bottomCenter,
            child: VtGradient(
                [theme.scaffoldBackgroundColor.withOpacity(0), theme.scaffoldBackgroundColor], const [0, 1],
                height: 150),
          )
        ],
      ],
    );
  }
}

class _LandingPageImage extends StatelessWidget {
  _LandingPageImage(this.imagePath, this.offset, {Key? key, required this.height, this.scaleOnHover = true})
      : super(key: key);
  final Offset offset;
  final String imagePath;
  final double height;
  final bool scaleOnHover;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMouseOverNotifier,
      builder: (_, bool isMouseOver, __) {
        double scale = isMouseOver ? 1.05 : 1;
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          height: height,
          child: folio.AnimatedScale(
            begin: 1,
            end: scale,
            duration: Times.fast,
            curve: Curves.easeOut,
            child: MouseRegion(
              onEnter: (_) => _isMouseOverNotifier.value = true && scaleOnHover,
              onExit: (_) => _isMouseOverNotifier.value = false,
              child: Image.asset(
                "assets/images/landing_page/$imagePath",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        );
      },
    );
  }
}
