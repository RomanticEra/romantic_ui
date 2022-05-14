import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'themes.dart';

part 'app_model.g.dart';

@JsonSerializable()
@DataRepository([], remote: false)
class AppModel extends DataModel<AppModel> {
  static const kVersion = "1.2.3";
  AppModel({this.touchMode, this.theme});

  get id => 'AppModel';
  final BelongsTo<AppTheme>? theme;
  final BelongsTo<TouchMode>? touchMode;
}

@JsonSerializable()
@DataRepository([], remote: false)
class TouchMode extends DataModel<TouchMode> {
  TouchMode({this.enabled = true, this.appModel});

  @override
  get id => 'TouchMode';
  final bool enabled;
  final BelongsTo<AppModel>? appModel;
}
