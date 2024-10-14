// library permission_handler;
import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restdio1/screens/permission_handler/permission_enum.dart';
import 'package:restdio1/utils/permission/codec.dart';

/// Provides a cross-platform (iOS, Android) API to request and check permissions.

class permissionHandlerDemo extends StatefulWidget {
  const permissionHandlerDemo({super.key});

  @override
  State<permissionHandlerDemo> createState() => _permissionHandlerDemoState();
}

class _permissionHandlerDemoState extends State<permissionHandlerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              debugPrint('Button clicked for settings !');
              PermissionHandler().openAppSettings();
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
            children: PermissionGroup.values
                .where((PermissionGroup permission) {
                  if (io.Platform.isIOS) {
                    return permission != PermissionGroup.camera &&
                        permission != PermissionGroup.photos &&
                        permission != PermissionGroup.storage;
                  } else {
                    return permission != PermissionGroup.unknown ;
                  }
                })
                .map((PermissionGroup permission) =>
                    PermissionWidget(permission))
                .toList()),
      ),
    );
  }
}

class PermissionHandler {
  factory PermissionHandler() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          MethodChannel('flutter.baseflow.com/permissions/methods');

      _instance = PermissionHandler.private(methodChannel);
    }
    return _instance;
  }

  @visibleForTesting
  PermissionHandler.private(this._methodChannel);

  static PermissionHandler _instance = PermissionHandler();

  final MethodChannel _methodChannel;

  /// Returns a [Future] containing the current permission status for the supplied [PermissionGroup].
  Future<PermissionStatus> checkPermissionStatus(
      PermissionGroup permission) async {
    final dynamic status = await _methodChannel.invokeMethod(
        'checkPermissionStatus', Codec.encodePermissionGroup(permission));

    return Codec.decodePermissionStatus(status);
  }

  /// Open the App settings page.
  ///
  /// Returns [true] if the app settings page could be opened, otherwise [false] is returned.
  Future<bool> openAppSettings() async {
    debugPrint('Here inside openSettings');
    final bool hasOpened = await _methodChannel.invokeMethod('openAppSettings');
    return hasOpened;
  }

  /// Request the user for access to the supplied list of permissiongroups.
  ///
  /// Returns a [Map] containing the status per requested permissiongroup.
  Future<Map<PermissionGroup, PermissionStatus>> requestPermissions(
      List<PermissionGroup> permissions) async {
    final String jsonData = Codec.encodePermissionGroups(permissions);
    final dynamic status =
        await _methodChannel.invokeMethod('requestPermissions', jsonData);

    return Codec.decodePermissionRequestResult(status);
  }

  /// Request to see if you should show a rationale for requesting permission.
  ///
  /// This method is only implemented on Android, calling this on iOS always
  /// returns [false].
  Future<bool> shouldShowRequestPermissionRationale(
      PermissionGroup permission) async {
    if (!io.Platform.isAndroid) {
      return false;
    }

    final bool shouldShowRationale = await _methodChannel.invokeMethod(
        'shouldShowRequestPermissionRationale',
        Codec.encodePermissionGroup(permission));

    return shouldShowRationale;
  }
}

class PermissionWidget extends StatefulWidget {
  const PermissionWidget(this._permissionGroup);

  final PermissionGroup _permissionGroup;

  @override
  _PermissionState createState() => _PermissionState(_permissionGroup);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permissionGroup);

  final PermissionGroup _permissionGroup;
  PermissionStatus _permissionStatus = PermissionStatus.unknown;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() {
    final Future<PermissionStatus> statusFuture =
        PermissionHandler().checkPermissionStatus(_permissionGroup);

    statusFuture.then((PermissionStatus status) {
      setState(() {
        _permissionStatus = status;
      });
    });
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_permissionGroup.toString()),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      onTap: () async {
        requestPermission(_permissionGroup);
      },
    );
  }

  void requestPermission(PermissionGroup permission) {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Future<Map<PermissionGroup, PermissionStatus>> requestFuture =
        PermissionHandler().requestPermissions(permissions);

    requestFuture
        .then((Map<PermissionGroup, PermissionStatus> permissionRequestResult) {
      setState(() {
        _permissionStatus = permissionRequestResult[permission]!;
      });
    });
  }
}
