import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivityChartCard extends StatelessWidget {
  const ActivityChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 288,
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0x350A100A),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0x301C321C)),
      ),
      child: Column(
        children: [
          const Text(
            'Dopamine Levels During Physical Activity',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(child: LineChart(_chartData, duration: Duration.zero)),
        ],
      ),
    );
  }

  LineChartData get _chartData {
    return LineChartData(
      minX: 0,
      maxX: 120,
      minY: 50,
      maxY: 105,
      backgroundColor: const Color(0xFF071007),
      gridData: FlGridData(
        show: true,
        horizontalInterval: 10,
        verticalInterval: 20,
        getDrawingHorizontalLine: (_) => const FlLine(
          color: Color(0x222B3B2B),
          strokeWidth: 1,
          dashArray: [4, 4],
        ),
        getDrawingVerticalLine: (_) => const FlLine(
          color: Color(0x222B3B2B),
          strokeWidth: 1,
          dashArray: [4, 4],
        ),
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          axisNameWidget: const Text(
            'Medication Sites',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 10,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(color: Colors.white70, fontSize: 8),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 20,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(color: Colors.white70, fontSize: 8),
              );
            },
          ),
        ),
      ),
      lineTouchData: const LineTouchData(enabled: false),
      lineBarsData: [
        _line(const [
          FlSpot(0, 77),
          FlSpot(10, 95),
          FlSpot(20, 80),
          FlSpot(30, 57),
          FlSpot(40, 77),
          FlSpot(50, 83),
        ], const Color(0xFF72FF22)),
        _line(const [
          FlSpot(50, 83),
          FlSpot(60, 77),
          FlSpot(70, 80),
          FlSpot(80, 57),
          FlSpot(90, 86),
          FlSpot(100, 51),
        ], const Color(0xFFFF7B1A)),
        _line(const [
          FlSpot(100, 51),
          FlSpot(110, 57),
          FlSpot(120, 66),
        ], const Color(0xFFFF3525)),
        LineChartBarData(
          spots: const [FlSpot(0, 77), FlSpot(120, 77)],
          isCurved: false,
          color: Colors.white70,
          barWidth: 1,
          dashArray: [2, 4],
          dotData: const FlDotData(show: false),
        ),
      ],
    );
  }

  LineChartBarData _line(List<FlSpot> spots, Color color) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      curveSmoothness: .25,
      color: color,
      barWidth: 2,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, bar, index) {
          return FlDotCirclePainter(
            radius: 2.5,
            color: Colors.white,
            strokeColor: color,
            strokeWidth: 1.5,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: true,
        color: color.withValues(alpha: .04),
      ),
    );
  }
}
