import 'package:flutter/material.dart';

class BasicConcept {
  final String title;
  final IconData icon;
  final String difficulty;
  final String readTime;
  final String description;
  final String content;
  final List<String> tips;

  BasicConcept({
    required this.title,
    required this.icon,
    required this.difficulty,
    required this.readTime,
    required this.description,
    required this.content,
    required this.tips,
  });
}

class BestPractice {
  final String title;
  final IconData icon;
  final String category;
  final String description;
  final List<String> benefits;
  final List<String> steps;

  BestPractice({
    required this.title,
    required this.icon,
    required this.category,
    required this.description,
    required this.benefits,
    required this.steps,
  });
}
