/// Device information from DIS (Device Information Service)
class PolarDeviceInformation {
  /// Firmware version
  final String firmwareVersion;

  /// Hardware code
  final String hardwareCode;

  /// Design revision
  final String designRevision;

  /// Manufacture date
  final String manufactureDate;

  /// Production revision
  final String productionRevision;

  /// Manufacturer name
  final String manufacturerName;

  /// Battery device type
  final String batteryDeviceType;

  /// Model
  final String model;

  /// Serial number
  final String serialNumber;

  /// PCB revision
  final String pcbRevision;

  /// Software revision
  final String softwareRevision;

  /// Hardware revision
  final String hardwareRevision;

  /// Constructor
  PolarDeviceInformation({
    required this.firmwareVersion,
    required this.hardwareCode,
    required this.designRevision,
    required this.manufactureDate,
    required this.productionRevision,
    required this.manufacturerName,
    required this.batteryDeviceType,
    required this.model,
    required this.serialNumber,
    required this.pcbRevision,
    required this.softwareRevision,
    required this.hardwareRevision,
  });

  /// From JSON
  factory PolarDeviceInformation.fromJson(Map<String, dynamic> json) {
    return PolarDeviceInformation(
      firmwareVersion: json['firmwareVersion'] as String? ?? '',
      hardwareCode: json['hardwareCode'] as String? ?? '',
      designRevision: json['designRevision'] as String? ?? '',
      manufactureDate: json['manufactureDate'] as String? ?? '',
      productionRevision: json['productionRevision'] as String? ?? '',
      manufacturerName: json['manufacturerName'] as String? ?? '',
      batteryDeviceType: json['batteryDeviceType'] as String? ?? '',
      model: json['model'] as String? ?? '',
      serialNumber: json['serialNumber'] as String? ?? '',
      pcbRevision: json['pcbRevision'] as String? ?? '',
      softwareRevision: json['softwareRevision'] as String? ?? '',
      hardwareRevision: json['hardwareRevision'] as String? ?? '',
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      'firmwareVersion': firmwareVersion,
      'hardwareCode': hardwareCode,
      'designRevision': designRevision,
      'manufactureDate': manufactureDate,
      'productionRevision': productionRevision,
      'manufacturerName': manufacturerName,
      'batteryDeviceType': batteryDeviceType,
      'model': model,
      'serialNumber': serialNumber,
      'pcbRevision': pcbRevision,
      'softwareRevision': softwareRevision,
      'hardwareRevision': hardwareRevision,
    };
  }

  @override
  String toString() {
    return 'PolarDeviceInformation(firmwareVersion: $firmwareVersion, model: $model, serialNumber: $serialNumber)';
  }
}
