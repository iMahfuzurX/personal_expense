import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/chart_weekday.dart';

class Chart extends StatelessWidget {
  Chart({
    super.key,
  });

  List<int> chartList = [100, 10, 0, 0, 0, 0, 0]; //

  int countChartTotal(List<int> chartList) {
    var total = 0;
    for (int i = 0; i < chartList.length; i++) {
      total += chartList[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    int chartTotal = countChartTotal(chartList);
    List<String> day = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: chartList.map((item) {
            return ChartWeekDay(
                value: item,
                totalValue: chartTotal,
                dayTile: day[chartList.indexOf(item)]);
          }).toList()),
    );
  }
}
