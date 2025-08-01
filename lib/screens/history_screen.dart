import 'package:flutter/material.dart';
import '../models/history_item.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String searchTerm = '';
  String statusFilter = 'all';
  
  final List<HistoryItem> historyData = [
    HistoryItem(
      id: 1,
      date: '15 Mar 2024',
      time: '14:30',
      location: 'Parcela Norte',
      status: HistoryStatus.optimal,
      ph: 6.8,
      humidity: 65,
      temperature: 22,
      trend: TrendDirection.up,
    ),
    HistoryItem(
      id: 2,
      date: '10 Mar 2024',
      time: '09:15',
      location: 'Parcela Sur',
      status: HistoryStatus.warning,
      ph: 5.9,
      humidity: 45,
      temperature: 25,
      trend: TrendDirection.down,
    ),
    HistoryItem(
      id: 3,
      date: '05 Mar 2024',
      time: '16:45',
      location: 'Parcela Este',
      status: HistoryStatus.critical,
      ph: 5.2,
      humidity: 30,
      temperature: 28,
      trend: TrendDirection.down,
    ),
    HistoryItem(
      id: 4,
      date: '01 Mar 2024',
      time: '11:20',
      location: 'Parcela Norte',
      status: HistoryStatus.optimal,
      ph: 6.5,
      humidity: 70,
      temperature: 20,
      trend: TrendDirection.up,
    ),
    HistoryItem(
      id: 5,
      date: '25 Feb 2024',
      time: '13:10',
      location: 'Parcela Oeste',
      status: HistoryStatus.warning,
      ph: 7.2,
      humidity: 55,
      temperature: 24,
      trend: TrendDirection.stable,
    ),
  ];

  List<HistoryItem> get filteredData {
    return historyData.where((item) {
      final matchesSearch = item.location.toLowerCase().contains(searchTerm.toLowerCase()) ||
          item.date.toLowerCase().contains(searchTerm.toLowerCase());
      final matchesStatus = statusFilter == 'all' || item.status.name == statusFilter;
      return matchesSearch && matchesStatus;
    }).toList();
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
                            'Historial de Análisis',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D5016),
                            ),
                          ),
                          Text(
                            'Revisa tus análisis anteriores',
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
                      // Filters Card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.filter_list, color: Color(0xFF2D5016)),
                                  SizedBox(width: 8),
                                  Text(
                                    'Filtros',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2D5016),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Buscar por ubicación o fecha...',
                                  prefixIcon: const Icon(Icons.search, color: Color(0xFF4CAF50)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(color: Color(0xFF4CAF50)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(color: Color(0xFF2D5016), width: 2),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    searchTerm = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 12),
                              DropdownButtonFormField<String>(
                                value: statusFilter,
                                decoration: InputDecoration(
                                  labelText: 'Estado del suelo',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(color: Color(0xFF4CAF50)),
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(value: 'all', child: Text('Todos los estados')),
                                  DropdownMenuItem(value: 'optimal', child: Text('Óptimo')),
                                  DropdownMenuItem(value: 'warning', child: Text('Precaución')),
                                  DropdownMenuItem(value: 'critical', child: Text('Crítico')),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    statusFilter = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Results Summary
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Text(
                                      filteredData.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                    const Text(
                                      'Análisis encontrados',
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
                                    Text(
                                      filteredData.where((item) => item.status == HistoryStatus.optimal).length.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                    const Text(
                                      'Estados óptimos',
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
                                    Text(
                                      filteredData.where((item) => item.status == HistoryStatus.critical).length.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFF44336),
                                      ),
                                    ),
                                    const Text(
                                      'Estados críticos',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFF44336),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // History List
                      if (filteredData.isEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 48,
                                  color: Color(0xFFBDBDBD),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'No se encontraron análisis',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2D5016),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Intenta ajustar los filtros o realizar un nuevo análisis',
                                  style: TextStyle(
                                    color: Color(0xFF4CAF50),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Nuevo Análisis'),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        ...filteredData.map((analysis) => Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today, size: 16, color: Color(0xFF4CAF50)),
                                    const SizedBox(width: 8),
                                    Text(
                                      analysis.date,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2D5016),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      analysis.time,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      analysis.trend == TrendDirection.up
                                          ? Icons.trending_up
                                          : analysis.trend == TrendDirection.down
                                              ? Icons.trending_down
                                              : Icons.trending_flat,
                                      size: 16,
                                      color: analysis.trend == TrendDirection.up
                                          ? Colors.green
                                          : analysis.trend == TrendDirection.down
                                              ? Colors.red
                                              : Colors.grey,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  analysis.location,
                                  style: const TextStyle(
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text('pH: ${analysis.ph}', style: const TextStyle(fontSize: 12)),
                                          Text('Humedad: ${analysis.humidity}%', style: const TextStyle(fontSize: 12)),
                                          Text('Temp: ${analysis.temperature}°C', style: const TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: analysis.status == HistoryStatus.optimal
                                            ? const Color(0xFFE8F5E8)
                                            : analysis.status == HistoryStatus.warning
                                                ? const Color(0xFFFFF3E0)
                                                : const Color(0xFFFFEBEE),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            analysis.status == HistoryStatus.optimal
                                                ? Icons.check_circle
                                                : analysis.status == HistoryStatus.warning
                                                    ? Icons.warning
                                                    : Icons.error,
                                            size: 16,
                                            color: analysis.status == HistoryStatus.optimal
                                                ? const Color(0xFF4CAF50)
                                                : analysis.status == HistoryStatus.warning
                                                    ? const Color(0xFFFF9800)
                                                    : const Color(0xFFF44336),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            analysis.status == HistoryStatus.optimal
                                                ? 'Óptimo'
                                                : analysis.status == HistoryStatus.warning
                                                    ? 'Precaución'
                                                    : 'Crítico',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: analysis.status == HistoryStatus.optimal
                                                  ? const Color(0xFF4CAF50)
                                                  : analysis.status == HistoryStatus.warning
                                                      ? const Color(0xFFFF9800)
                                                      : const Color(0xFFF44336),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.visibility, size: 16),
                                        label: const Text('Ver'),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(color: Color(0xFF4CAF50)),
                                          foregroundColor: const Color(0xFF2D5016),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.download, size: 16),
                                        label: const Text('Exportar'),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(color: Color(0xFF4CAF50)),
                                          foregroundColor: const Color(0xFF2D5016),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
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
