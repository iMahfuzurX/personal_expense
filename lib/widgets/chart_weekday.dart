import 'package:flutter/material.dart';

class ChartWeekDay extends StatelessWidget {
  final int value;
  final int totalValue;
  final String dayTile;

  const ChartWeekDay({
    required this.value,
    required this.totalValue,
    required this.dayTile,
    super.key,
  });

  double calculateChart(int value, int totalValue) {
    double total = value / totalValue * 100;
    return total <= 100 ? total : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            '\$$value',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          Container(
            width: 25,
            height: (100 - calculateChart(value, totalValue)),
            color: Colors.grey,
          ),
          Container(
            width: 25,
            height: calculateChart(value, totalValue),
            color: Colors.black,
          ),
          Text(
            '$dayTile',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
