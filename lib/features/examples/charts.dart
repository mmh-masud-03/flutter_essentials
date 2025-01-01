import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Charts Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Bar Chart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Expanded(
                        child: BarChart(
                          BarChartData(
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: List.generate(
                              5,
                                  (index) => BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: (index + 1) * 10.0,
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Line Chart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Expanded(
                        child: LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: List.generate(
                                  5,
                                      (index) => FlSpot(index.toDouble(), (index * 15 + 10).toDouble()),
                                ),
                                isCurved: true,
                                color: Colors.green,
                                barWidth: 3,
                                dotData: const FlDotData(show: true),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Pie Chart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Expanded(
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 2,
                            centerSpaceRadius: 40,
                            sections: [
                              PieChartSectionData(
                                value: 35,
                                color: Colors.red,
                                title: '35%',
                                radius: 100,
                              ),
                              PieChartSectionData(
                                value: 40,
                                color: Colors.blue,
                                title: '40%',
                                radius: 100,
                              ),
                              PieChartSectionData(
                                value: 25,
                                color: Colors.green,
                                title: '25%',
                                radius: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}