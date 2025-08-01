import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../models/analysis_data.dart';
import '../widgets/metric_card_detailed.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final AnalysisData analysisData = AnalysisData(
    date: '15 de Marzo, 2024',
    time: '14:30',
    location: 'Parcela Norte',
    ph: MetricData(value: 6.8, status: MetricStatus.optimal, trend: TrendDirection.up),
    humidity: MetricData(value: 65, status: MetricStatus.optimal, trend: TrendDirection.stable),
    temperature: MetricData(value: 22, status: MetricStatus.optimal, trend: TrendDirection.up),
    nitrogen: MetricData(value: 45, status: MetricStatus.warning, trend: TrendDirection.down),
    phosphorus: MetricData(value: 38, status: MetricStatus.critical, trend: TrendDirection.down),
    potassium: MetricData(value: 52, status: MetricStatus.optimal, trend: TrendDirection.up),
    organicMatter: MetricData(value: 3.2, status: MetricStatus.optimal, trend: TrendDirection.stable),
    conductivity: MetricData(value: 1.8, status: MetricStatus.optimal, trend: TrendDirection.stable),
  );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF2D5016)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Análisis Detallado',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D5016),
                          ),
                        ),
                        Text(
                          '${analysisData.date} - ${analysisData.time}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                        Text(
                          analysisData.location,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8BC34A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Tabs
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelColor: const Color(0xFF2D5016),
                unselectedLabelColor: Colors.grey,
                indicatorColor: const Color(0xFF2D5016),
                tabs: const [
                  Tab(text: 'Físicas'),
                  Tab(text: 'Químicas'),
                  Tab(text: 'Nutrientes'),
                ],
              ),
            ),

            // Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Físicas
                  _buildTabContent([
                    MetricCardDetailed(
                      title: 'Humedad',
                      icon: FeatherIcons.droplet,
                      data: analysisData.humidity,
                      unit: '%',
                      description: 'Nivel óptimo para la mayoría de cultivos',
                    ),
                    MetricCardDetailed(
                      title: 'Temperatura',
                      icon: FeatherIcons.thermometer,
                      data: analysisData.temperature,
                      unit: '°C',
                      description: 'Temperatura ideal para germinación',
                    ),
                  ]),

                  // Químicas
                  _buildTabContent([
                    MetricCardDetailed(
                      title: 'pH del Suelo',
                      icon: FeatherIcons.activity,
                      data: analysisData.ph,
                      unit: '',
                      description: 'Ligeramente ácido - Ideal para nutrientes',
                    ),
                    MetricCardDetailed(
                      title: 'Conductividad',
                      icon: FeatherIcons.sliders,
                      data: analysisData.conductivity,
                      unit: ' dS/m',
                      description: 'Salinidad dentro del rango normal',
                    ),
                    MetricCardDetailed(
                      title: 'Materia Orgánica',
                      icon: FeatherIcons.globe,
                      data: analysisData.organicMatter,
                      unit: '%',
                      description: 'Buen contenido de materia orgánica',
                    ),
                  ]),

                  // Nutrientes
                  _buildTabContent([
                    MetricCardDetailed(
                      title: 'Nitrógeno (N)',
                      icon: FeatherIcons.trendingDown,
                      data: analysisData.nitrogen,
                      unit: '%',
                      description: 'Necesita fertilización nitrogenada',
                    ),
                    MetricCardDetailed(
                      title: 'Fósforo (P)',
                      icon: FeatherIcons.alertTriangle,
                      data: analysisData.phosphorus,
                      unit: '%',
                      description: 'Nivel crítico - Aplicar fertilizante fosfórico',
                    ),
                    MetricCardDetailed(
                      title: 'Potasio (K)',
                      icon: FeatherIcons.checkCircle,
                      data: analysisData.potassium,
                      unit: '%',
                      description: 'Excelente nivel de potasio',
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(List<Widget> cards) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          for (int i = 0; i < cards.length; i++) ...[
            cards[i],
            if (i < cards.length - 1) const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
