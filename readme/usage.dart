import 'package:flutter/foundation.dart';
import 'package:polar/polar.dart';

const identifier = '1C709B20';
final polar = Polar();

void example() {
  polar.connectToDevice(identifier);
  streamWhenReady();
}

void streamWhenReady() async {
  await polar.sdkFeatureReady.firstWhere(
    (e) =>
        e.identifier == identifier &&
        e.feature == PolarSdkFeature.onlineStreaming,
  );
  final availabletypes = await polar.getAvailableOnlineStreamDataTypes(
    identifier,
  );

  debugPrint('available types: $availabletypes');

  if (availabletypes.contains(PolarDataType.hr)) {
    polar
        .startHrStreaming(identifier)
        .listen((e) => debugPrint('HR data received'));
  }
  if (availabletypes.contains(PolarDataType.ecg)) {
    polar
        .startEcgStreaming(identifier)
        .listen((e) => debugPrint('ECG data received'));
  }
  if (availabletypes.contains(PolarDataType.acc)) {
    polar
        .startAccStreaming(identifier)
        .listen((e) => debugPrint('ACC data received'));
  }
}

void firmwareUpdateExample() {
  // Check if a firmware update is available
  polar.checkFirmwareUpdate(identifier).listen((status) {
    debugPrint('Firmware update check: ${status.type}');
    if (status.type == 'available') {
      debugPrint('Available version: ${status.version}');

      // Perform the firmware update
      // WARNING: This will erase all data on the device
      polar.updateFirmware(identifier).listen((update) {
        debugPrint(
          'Firmware update status: ${update.type} ${update.details ?? ''}',
        );

        if (update.type == 'completed') {
          debugPrint('Firmware update completed!');
        }
      });
    } else {
      debugPrint('No firmware update available: ${status.details ?? ''}');
    }
  });
}
