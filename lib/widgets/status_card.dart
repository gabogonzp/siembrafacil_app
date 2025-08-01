import 'package:flutter/material.dart';
import '../models/soil_data.dart';

class StatusCard extends StatelessWidget {
  final SoilData soilData;

  const StatusCard({super.key, required this.soilData});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusText;
    String statusMessage;

    switch (soilData.overallStatus) {
      case SoilStatus.optimal:
        statusColor = const Color(0xFF4CAF50);
        statusIcon = Icons.check_circle;
        statusText = 'EXCELENTE';
        statusMessage = 'Tu suelo está perfecto para sembrar';
        break;
      case SoilStatus.warning:
        statusColor = const Color(0xFFFF9800);
        statusIcon = Icons.warning;
        statusText = 'NECESITA ATENCIÓN';
        statusMessage = 'Algunos valores necesitan mejorarse';
        break;
      case SoilStatus.critical:
        statusColor = const Color(0xFFF44336);
        statusIcon = Icons.error;
        statusText = 'URGENTE';
        statusMessage = 'Requiere acción inmediata';
        break;
    }

    return Card(
      color: statusColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: statusColor, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                statusIcon,
                size: 32,
                color: statusColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    statusText,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    statusMessage,
                    style: TextStyle(
                      fontSize: 18,
                      color: statusColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Última actualización: ${soilData.lastUpdate}',
                    style: TextStyle(
                      fontSize: 14,
                      color: statusColor.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
