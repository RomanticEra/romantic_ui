# Source
* flutterfolio
1. https://www.flutterfolio.com/#/?
2. https://github.com/gskinnerTeam/flutter-folio/

* 2205141517 module
1. dir list as:
mkdir routes utils providers views components 
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

* aspect of auth
1. DeviceScreens as Background
2. auth is Flex with (hideDevices,useVerticalLayout)

