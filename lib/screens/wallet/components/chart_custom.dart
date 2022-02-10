import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:test2/variable/variable_color.dart';

class ChartCustom extends StatefulWidget {
  const ChartCustom({Key? key}) : super(key: key);

  @override
  _ChartCustomState createState() => _ChartCustomState();
}

class _ChartCustomState extends State<ChartCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 15, 15, 15),
      width: Get.width,
      height: Get.width / 1.3,
      child: LineChart(
        LineChartData(
            gridData: FlGridData(
              drawHorizontalLine: false,
              drawVerticalLine: false,
            ),
            borderData: FlBorderData(
              show: false,
            ),
            titlesData: FlTitlesData(
                topTitles: SideTitles(
                  showTitles: false,
                ),
                leftTitles: SideTitles(
                  showTitles: false,
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 1:
                        return 'Mon';
                      case 2:
                        return 'Tue';
                      case 3:
                        return 'Wed';
                      case 4:
                        return 'Thu';
                      case 5:
                        return 'Fri';
                      case 6:
                        return 'Sat';
                      case 7:
                        return 'Sun';
                    }
                    return '';
                  },
                )),
            lineBarsData: [
              LineChartBarData(
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    colors: [
                      colorBluePrimary,
                      Colors.transparent,
                    ],
                  ),
                  colorStops: [
                    0.0,
                    0.5,
                    1.0,
                  ],
                  spots: const [
                    FlSpot(1, 0),
                    FlSpot(2, 50),
                    FlSpot(3, 100),
                    FlSpot(4, 200),
                    FlSpot(5, 400),
                    FlSpot(6, 600),
                    FlSpot(7, 1000),
                  ],
                  isCurved: true,
                  isStepLineChart: false,
                  colors: [
                    const Color(0xff199EFF),
                    const Color(0xff199EFF),
                  ]),
            ]),
      ),
    );
  }
}
