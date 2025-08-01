import 'package:flutter/material.dart';
import '../models/crop_recommendation.dart';
import '../models/soil_improvement.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<CropRecommendation> cropRecommendations = [
    CropRecommendation(
      name: 'Maíz',
      icon: '🌽',
      compatibility: 95,
      season: 'Primavera-Verano',
      reason: 'pH ideal y buena humedad',
      benefits: ['Alto rendimiento esperado', 'Condiciones óptimas', 'Buen drenaje'],
    ),
    CropRecommendation(
      name: 'Frijol',
      icon: '🫘',
      compatibility: 88,
      season: 'Todo el año',
      reason: 'Excelente para fijar nitrógeno',
      benefits: ['Mejora el suelo', 'Resistente', 'Complementa otros cultivos'],
    ),
    CropRecommendation(
      name: 'Tomate',
      icon: '🍅',
      compatibility: 82,
      season: 'Primavera',
      reason: 'Requiere ajuste menor de pH',
      benefits: ['Alto valor comercial', 'Demanda constante', 'Cultivo rentable'],
    ),
    CropRecommendation(
      name: 'Lechuga',
      icon: '🥬',
      compatibility: 78,
      season: 'Otoño-Invierno',
      reason: 'Buena humedad, temperatura ideal',
      benefits: ['Ciclo corto', 'Fácil manejo', 'Mercado local'],
    ),
  ];

  final List<SoilImprovement> soilImprovements = [
    SoilImprovement(
      title: 'Aplicar Fertilizante Fosfórico',
      priority: Priority.high,
      icon: Icons.flash_on,
      description: 'El fósforo está en nivel crítico (38%). Aplicar 50kg/ha de superfosfato.',
      timeframe: 'Inmediato',
      cost: 'Medio',
      steps: [
        'Adquirir superfosfato triple (46% P2O5)',
        'Aplicar 50kg por hectárea',
        'Incorporar al suelo con rastra',
        'Regar ligeramente después de la aplicación',
      ],
    ),
    SoilImprovement(
      title: 'Fertilización Nitrogenada',
      priority: Priority.medium,
      icon: Icons.eco,
      description: 'Nitrógeno en descenso (45%). Aplicar urea o sulfato de amonio.',
      timeframe: '1-2 semanas',
      cost: 'Bajo',
      steps: [
        'Aplicar 30kg/ha de urea',
        'Dividir en 2 aplicaciones',
        'Aplicar cerca de las raíces',
        'Regar inmediatamente',
      ],
    ),
    SoilImprovement(
      title: 'Optimizar Riego',
      priority: Priority.low,
      icon: Icons.water_drop,
      description: 'Mantener humedad actual (65%) con riego eficiente.',
      timeframe: 'Continuo',
      cost: 'Bajo',
      steps: [
        'Riego temprano en la mañana',
        'Evitar encharcamientos',
        'Usar mulch para conservar humedad',
        'Monitorear semanalmente',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color getCompatibilityColor(int compatibility) {
    if (compatibility >= 90) return const Color(0xFF4CAF50);
    if (compatibility >= 80) return const Color(0xFFFF9800);
    return const Color(0xFFF44336);
  }

  Color getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.high:
        return const Color(0xFFF44336);
      case Priority.medium:
        return const Color(0xFFFF9800);
      case Priority.low:
        return const Color(0xFF4CAF50);
    }
  }

  String getPriorityText(Priority priority) {
    switch (priority) {
      case Priority.high:
        return 'Alta';
      case Priority.medium:
        return 'Media';
      case Priority.low:
        return 'Baja';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF6F8FC),
              Color(0xFFF6F8FC),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF2D5016)),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recomendaciones Inteligentes',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D5016),
                            ),
                          ),
                          Text(
                            'Basadas en tu análisis del 15 de Marzo, 2024',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Summary Card
                      Card(
                        color: const Color(0xFFF6F8FC),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.trending_up, color: Color(0xFF2D5016)),
                                  SizedBox(width: 8),
                                  Text(
                                    'Resumen de Recomendaciones',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2D5016),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          '4',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF4CAF50),
                                          ),
                                        ),
                                        const Text(
                                          'Cultivos recomendados',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF4CAF50),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          '3',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFF9800),
                                          ),
                                        ),
                                        const Text(
                                          'Mejoras sugeridas',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFFF9800),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          '85%',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF2196F3),
                                          ),
                                        ),
                                        const Text(
                                          'Potencial del terreno',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF2196F3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Tabs
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F8FC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: const Color(0xFF2D5016),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: const Color(0xFF2D5016),
                          tabs: const [
                            Tab(text: 'Qué Sembrar'),
                            Tab(text: 'Mejorar Terreno'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Tab Content
                      SizedBox(
                        height: 600,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Crops Tab
                            ListView.builder(
                              itemCount: cropRecommendations.length,
                              itemBuilder: (context, index) {
                                final crop = cropRecommendations[index];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              crop.icon,
                                              style: const TextStyle(fontSize: 32),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    crop.name,
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xFF2D5016),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.wb_sunny, size: 16, color: Color(0xFFFF9800)),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        crop.season,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Color(0xFF666666),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: getCompatibilityColor(crop.compatibility).withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: getCompatibilityColor(crop.compatibility),
                                                ),
                                              ),
                                              child: Text(
                                                '${crop.compatibility}% compatible',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: getCompatibilityColor(crop.compatibility),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Por qué es ideal: ${crop.reason}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF4CAF50),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        const Text(
                                          'Beneficios:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF2D5016),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        ...crop.benefits.map((benefit) => Padding(
                                          padding: const EdgeInsets.only(left: 8, bottom: 2),
                                          child: Text(
                                            '• $benefit',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF4CAF50),
                                            ),
                                          ),
                                        )),
                                        const SizedBox(height: 16),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.arrow_forward),
                                            label: Text('Ver Guía de ${crop.name}'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            
                            // Improvements Tab
                            ListView.builder(
                              itemCount: soilImprovements.length,
                              itemBuilder: (context, index) {
                                final improvement = soilImprovements[index];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFE8F5E8),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Icon(
                                                improvement.icon,
                                                color: const Color(0xFF2D5016),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                improvement.title,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF2D5016),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: getPriorityColor(improvement.priority).withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                'Prioridad ${getPriorityText(improvement.priority)}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: getPriorityColor(improvement.priority),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          improvement.description,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF666666),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            const Icon(Icons.access_time, size: 16, color: Color(0xFF4CAF50)),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Tiempo: ${improvement.timeframe}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF4CAF50),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Text(
                                              'Costo: ${improvement.cost}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF4CAF50),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Pasos a seguir:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF2D5016),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        ...improvement.steps.asMap().entries.map((entry) {
                                          final index = entry.key;
                                          final step = entry.value;
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFE8F5E8),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${index + 1}',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xFF2D5016),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    step,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF4CAF50),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                        const SizedBox(height: 16),
                                        SizedBox(
                                          width: double.infinity,
                                          child: OutlinedButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.arrow_forward),
                                            label: const Text('Ver Más Detalles'),
                                            style: OutlinedButton.styleFrom(
                                              side: const BorderSide(color: Color(0xFF4CAF50)),
                                              foregroundColor: const Color(0xFF2D5016),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100), // Space for bottom navigation
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
