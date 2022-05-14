# Source
* flutterfolio
1. https://www.flutterfolio.com/#/?
2. https://github.com/gskinnerTeam/flutter-folio/

* 2205141517 module
1. dir list as:
mkdir -p routes utils providers views/{layout,widget} components models
utils
    + native_window_utils
      - Deadcode found on IoUtilsNative->{WindowsTitleBar,MacosTitleBar}
    >/Users/huangzheng/frontend/flutter-folio/lib/_utils/native_window_utils
    + notifications->close_notification
      - `class CloseNotification extends Notification {}`
    + **timed maybe useful**
    + universal_file
    > io_file **ref to** {logger.dart,path_utils}
    > web_file **ref to** {shared_preferences}, so make it **comment**
model
    + use flutter_data to make it to be model
    > import package
    > build with `flutter pub run build_runner build --delete-conflicting-outputs`
view
    + layout->simple_form_page->device_screens
    > asset landing_page, widget -> {gradient_container.dart, animated_scale.dart as folio;}
    _LandingPageImage
    ```dart
    folio.AnimatedScale(
            begin: 1,
            end: scale//1.05
    ...
    MouseRegion(onEnter(ValueNotifier false=> true ))
    ```
[SimpleFormPage](https://www.bilibili.com/video/BV1ZT4y1B7zX?spm_id_from=333.999.list.card_archive.click)

* aspect of auth
1. DeviceScreens as Background
2. auth is Flex with (hideDevices,useVerticalLayout)

