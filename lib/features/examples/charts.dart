import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Charts Example')),
      body: Center(
        child: BarChart(
          BarChartData(
            barGroups: List.generate(
              5,
                  (index) => BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(toY: (index + 1) * 10.0, color: Colors.blue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
