import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/swing_capture.dart';

class SwingGraph extends StatelessWidget {
  final SwingCapture swing;
  final VoidCallback onDelete;

  const SwingGraph({super.key, required this.swing, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final flexEx = swing.flexionExtension;
    final radUln = swing.ulnarRadial;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Wrist Motion Graph',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.delete_rounded, color: Colors.red),
              tooltip: 'Delete Swing',
              onPressed: onDelete,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    maxIncluded: false,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    minIncluded: false,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              lineBarsData: [
                _buildLine(flexEx, Colors.cyan, 'Flexion/Extension'),
                _buildLine(radUln, Colors.orange, 'Ulnar/Radial'),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        '${spot.bar.color == Colors.cyan ? "Flex/Ext" : "Ulnar/Rad"}: ${spot.y.toStringAsFixed(2)}',
                        const TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                ),
              ),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(show: true),
              minX: 0,
              maxX: (flexEx.length - 1).toDouble(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            LegendDot(color: Colors.cyan, label: 'Flexion/Extension'),
            SizedBox(width: 16),
            LegendDot(color: Colors.orange, label: 'Ulnar/Radial'),
          ],
        ),
      ],
    );
  }

  LineChartBarData _buildLine(List<double> values, Color color, String label) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: 2,
      dotData: FlDotData(show: false),
      spots: values
          .asMap()
          .entries
          .map((e) => FlSpot(e.key.toDouble(), e.value))
          .toList(),
    );
  }
}

class LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const LegendDot({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
