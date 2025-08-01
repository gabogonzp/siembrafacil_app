import 'package:flutter/material.dart';
import '../models/education_content.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<BasicConcept> basicConcepts = [
    BasicConcept(
      title: '¿Qué es el pH del suelo?',
      icon: Icons.flash_on,
      difficulty: 'Básico',
      readTime: '3 min',
      description: 'Aprende qué significa el pH y por qué es crucial para tus cultivos',
      content: 'El pH mide qué tan ácido o alcalino es tu suelo. Un pH de 7 es neutro, menos de 7 es ácido y más de 7 es alcalino.',
      tips: [
        'pH ideal para la mayoría de cultivos: 6.0-7.0',
        'Suelos ácidos (pH < 6): añadir cal',
        'Suelos alcalinos (pH > 8): añadir azufre',
        'Medir pH cada 6 meses',
      ],
    ),
    BasicConcept(
      title: 'Importancia de la Humedad',
      icon: Icons.water_drop,
      difficulty: 'Básico',
      readTime: '4 min',
      description: 'Cómo mantener el nivel correcto de agua en tu suelo',
      content: 'La humedad del suelo afecta directamente el crecimiento de las plantas y la absorción de nutrientes.',
      tips: [
        'Humedad ideal: 50-70% para la mayoría de cultivos',
        'Regar temprano en la mañana',
        'Usar mulch para conservar humedad',
        'Evitar encharcamientos',
      ],
    ),
    BasicConcept(
      title: 'Nutrientes NPK Explicados',
      icon: Icons.eco,
      difficulty: 'Intermedio',
      readTime: '5 min',
      description: 'Nitrógeno, Fósforo y Potasio: los nutrientes esenciales',
      content: 'NPK son los tres nutrientes principales que necesitan las plantas para crecer saludables.',
      tips: [
        'N (Nitrógeno): crecimiento de hojas verdes',
        'P (Fósforo): desarrollo de raíces y flores',
        'K (Potasio): resistencia a enfermedades',
        'Aplicar según la etapa de crecimiento',
      ],
    ),
    BasicConcept(
      title: 'Temperatura del Suelo',
      icon: Icons.thermostat,
      difficulty: 'Básico',
      readTime: '3 min',
      description: 'Cómo la temperatura afecta el crecimiento de tus plantas',
      content: 'La temperatura del suelo influye en la germinación, crecimiento de raíces y actividad microbiana.',
      tips: [
        'Temperatura ideal: 18-24°C para la mayoría',
        'Usar mulch para regular temperatura',
        'Plantar según la estación',
        'Proteger del frío extremo',
      ],
    ),
  ];

  final List<BestPractice> bestPractices = [
    BestPractice(
      title: 'Rotación de Cultivos',
      icon: Icons.refresh,
      category: 'Manejo',
      description: 'Alterna diferentes cultivos para mantener la salud del suelo',
      benefits: ['Previene plagas', 'Mejora fertilidad', 'Reduce enfermedades'],
      steps: [
        'Planifica rotación de 3-4 años',
        'Alterna cultivos de diferentes familias',
        'Incluye leguminosas para fijar nitrógeno',
        'Registra qué plantas en cada área',
      ],
    ),
    BestPractice(
      title: 'Compostaje Casero',
      icon: Icons.eco,
      category: 'Fertilización',
      description: 'Crea tu propio abono orgánico con residuos caseros',
      benefits: ['Reduce residuos', 'Mejora suelo', 'Ahorra dinero'],
      steps: [
        'Mezcla materiales verdes y marrones',
        'Mantén humedad adecuada',
        'Voltea cada 2 semanas',
        'Usa cuando esté oscuro y sin olor',
      ],
    ),
    BestPractice(
      title: 'Riego Eficiente',
      icon: Icons.water_drop,
      category: 'Agua',
      description: 'Técnicas para optimizar el uso del agua',
      benefits: ['Ahorra agua', 'Mejor crecimiento', 'Reduce costos'],
      steps: [
        'Riega temprano en la mañana',
        'Usa riego por goteo si es posible',
        'Aplica mulch alrededor de plantas',
        'Monitorea humedad del suelo',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case 'Básico':
        return const Color(0xFF4CAF50);
      case 'Intermedio':
        return const Color(0xFFFF9800);
      case 'Avanzado':
        return const Color(0xFFF44336);
      default:
        return const Color(0xFF9E9E9E);
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
                            'Centro Educativo',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D5016),
                            ),
                          ),
                          Text(
                            'Aprende sobre agricultura y análisis de suelo',
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
                      // Quick Stats
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    const Icon(Icons.book, size: 32, color: Color(0xFF4CAF50)),
                                    const SizedBox(height: 8),
                                    Text(
                                      basicConcepts.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                    const Text(
                                      'Conceptos básicos',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    const Icon(Icons.lightbulb, size: 32, color: Color(0xFF4CAF50)),
                                    const SizedBox(height: 8),
                                    Text(
                                      bestPractices.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                    const Text(
                                      'Buenas prácticas',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    const Icon(Icons.star, size: 32, color: Color(0xFF4CAF50)),
                                    const SizedBox(height: 8),
                                    const Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                    const Text(
                                      'Guías interpretación',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
                            Tab(text: 'Conceptos'),
                            Tab(text: 'Prácticas'),
                            Tab(text: 'Interpretar'),
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
                            // Basic Concepts
                            ListView.builder(
                              itemCount: basicConcepts.length,
                              itemBuilder: (context, index) {
                                final concept = basicConcepts[index];
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
                                                concept.icon,
                                                color: const Color(0xFF2D5016),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                concept.title,
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
                                                color: getDifficultyColor(concept.difficulty).withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                concept.difficulty,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: getDifficultyColor(concept.difficulty),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            const Icon(Icons.access_time, size: 16, color: Color(0xFF666666)),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${concept.readTime} de lectura',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF666666),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          concept.description,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF4CAF50),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          concept.content,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF2D5016),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        const Text(
                                          'Consejos clave:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF2D5016),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        ...concept.tips.map((tip) => Padding(
                                          padding: const EdgeInsets.only(left: 8, bottom: 2),
                                          child: Text(
                                            '• $tip',
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
                                            icon: const Icon(Icons.play_arrow),
                                            label: const Text('Leer Artículo Completo'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            
                            // Best Practices
                            ListView.builder(
                              itemCount: bestPractices.length,
                              itemBuilder: (context, index) {
                                final practice = bestPractices[index];
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
                                                practice.icon,
                                                color: const Color(0xFF2D5016),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    practice.title,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xFF2D5016),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFE3F2FD),
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Text(
                                                      practice.category,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Color(0xFF1976D2),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          practice.description,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF666666),
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
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 4,
                                          children: practice.benefits.map((benefit) => Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE8F5E8),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              benefit,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF2D5016),
                                              ),
                                            ),
                                          )).toList(),
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
                                        ...practice.steps.asMap().entries.map((entry) {
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
                                            label: const Text('Ver Guía Detallada'),
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
                            
                            // Interpretation Guide
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(Icons.book, color: Color(0xFF2D5016)),
                                              SizedBox(width: 8),
                                              Text(
                                                'Cómo interpretar los datos',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF2D5016),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            'Aprende a entender qué significan los valores y cómo actuar',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF666666),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          
                                          // pH Interpretation
                                          const Text(
                                            'pH',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2D5016),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          _buildInterpretationRow('< 5.5', 'Muy ácido', 'Aplicar cal agrícola', const Color(0xFFF44336)),
                                          _buildInterpretationRow('5.5-6.0', 'Ácido', 'Aplicar cal moderadamente', const Color(0xFFFF9800)),
                                          _buildInterpretationRow('6.0-7.0', 'Ideal', 'Mantener nivel actual', const Color(0xFF4CAF50)),
                                          _buildInterpretationRow('7.0-8.0', 'Alcalino', 'Aplicar azufre', const Color(0xFFFF9800)),
                                          _buildInterpretationRow('> 8.0', 'Muy alcalino', 'Aplicar azufre y materia orgánica', const Color(0xFFF44336)),
                                          
                                          const SizedBox(height: 16),
                                          
                                          // Humidity Interpretation
                                          const Text(
                                            'Humedad (%)',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2D5016),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          _buildInterpretationRow('< 30', 'Muy seco', 'Riego inmediato', const Color(0xFFF44336)),
                                          _buildInterpretationRow('30-50', 'Seco', 'Aumentar riego', const Color(0xFFFF9800)),
                                          _buildInterpretationRow('50-70', 'Ideal', 'Mantener nivel', const Color(0xFF4CAF50)),
                                          _buildInterpretationRow('70-85', 'Húmedo', 'Reducir riego', const Color(0xFFFF9800)),
                                          _buildInterpretationRow('> 85', 'Saturado', 'Mejorar drenaje', const Color(0xFFF44336)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  
                                  // General Tips Card
                                  Card(
                                    color: const Color(0xFFF1F8E9),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Consejos Generales',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2D5016),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Frecuencia de Medición:',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xFF2D5016),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text('• pH: cada 6 meses', style: TextStyle(fontSize: 14, color: Color(0xFF4CAF50))),
                                                    const Text('• Humedad: semanal', style: TextStyle(fontSize: 14, color: Color(0xFF4CAF50))),
                                                    const Text('• Temperatura: diaria', style: TextStyle(fontSize: 14, color: Color(0xFF4CAF50))),
                                                    const Text('• Nutrientes: cada 3 meses', style: TextStyle(fontSize: 14, color: Color(0xFF4CAF50))),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Mejores Momentos:',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xFF2D5016),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text('• Mañana temprano (6-8 AM)', style: TextStyle(fontSize: 14, color: Color(0xFF4CAF50))),
                                                    const Text('• Suelo sin riego reciente', style: TextStyle(fontSize: 14, color: Color(0xFF4CAF50))),
                                                    const Text('• Clima estable', style: TextStyle(fontSize: 14, color: Color(0xFF4CAF50))),
                                                    const Text('• Antes de fertilizar', style: TextStyle(fontSize: 14, color: Color(0xFF4CAF50))),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

  Widget _buildInterpretationRow(String range, String status, String action, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              range,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: Color(0xFF666666),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              status,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              action,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4CAF50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
