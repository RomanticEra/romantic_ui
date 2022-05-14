// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';

import 'adaptive.dart';

// Width and height for thumbnail images.
const mobileThumbnailSize = 60.0;

class ItemCard<T> extends StatelessWidget {
  const ItemCard({
    required Key key,
    required this.destination,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.subtitleSemantics,
  }) : super(key: key);
  final T destination;
  final Widget image;
  final String title;
  final String subtitle;
  final String subtitleSemantics;

  @override
  Widget build(BuildContext context) {
    // final isDesktop = isDisplayDesktop(context);
    final textTheme = Theme.of(context).textTheme;

    AdaptiveContainer deskItemCard = AdaptiveContainer(
        constraints: const AdaptiveConstraints.large(xlarge: true),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Semantics(
            container: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: image,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: SelectableText(
                    title,
                    style: textTheme.subtitle1,
                  ),
                ),
                SelectableText(
                  subtitle,
                  semanticsLabel: subtitleSemantics,
                  style: textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ));
    AdaptiveContainer mobileItemCard = AdaptiveContainer(
        constraints: const AdaptiveConstraints.medium(
          small: true,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: const EdgeInsetsDirectional.only(end: 8),
              leading: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: SizedBox(
                  width: mobileThumbnailSize,
                  height: mobileThumbnailSize,
                  child: image,
                ),
              ),
              title: SelectableText(title, style: textTheme.subtitle1),
              subtitle: SelectableText(
                subtitle,
                semanticsLabel: subtitleSemantics,
                style: textTheme.subtitle2,
              ),
            ),
            const Divider(thickness: 1),
          ],
        ));
    AdaptiveContainer watchItemCard = AdaptiveContainer(
        constraints: const AdaptiveConstraints.xsmall(),
        child: Stack(
          children: [
            Positioned.fill(
              child: image,
            ),
            Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: SelectableText(title, style: textTheme.subtitle1),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: SelectableText(
                    subtitle,
                    semanticsLabel: subtitleSemantics,
                    style: textTheme.subtitle2,
                  ),
                )
              ],
            )
          ],
        ));

    return AdaptiveColumn(children: [
      deskItemCard,
      mobileItemCard,
      watchItemCard,
    ]);
  }
}
