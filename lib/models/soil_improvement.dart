import 'package:flutter/material.dart';

enum Priority { high, medium, low }

class SoilImprovement {
  final String title;
  final Priority priority;
  final IconData icon;
  final String description;
  final String timeframe;
  final String cost;
  final List<String> steps;

  SoilImprovement({
    required this.title,
    required this.priority,
    required this.icon,
    required this.description,
    required this.timeframe,
    required this.cost,
    required this.steps,
  });
}
