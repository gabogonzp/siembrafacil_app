enum SoilStatus { optimal, warning, critical }

class SoilData {
  final double ph;
  final int humidity;
  final int temperature;
  final int nitrogen;
  final int phosphorus;
  final int potassium;
  final SoilStatus overallStatus;
  final String lastUpdate;

  SoilData({
    required this.ph,
    required this.humidity,
    required this.temperature,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.overallStatus,
    required this.lastUpdate,
  });
}
