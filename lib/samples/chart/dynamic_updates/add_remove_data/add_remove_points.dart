import 'dart:math';

import 'package:syncfusion_flutter_examples/model/helper.dart';
import 'package:syncfusion_flutter_examples/model/model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class AddDataPoints extends StatefulWidget {
  AddDataPoints({this.sample, Key key}) : super(key: key);
  SubItem sample;

  @override
  _LiveVerticalState createState() => _LiveVerticalState(sample);
}

List<ChartSampleData> chartData = chartData = <ChartSampleData>[
  ChartSampleData(x: 0, y: 10),
  ChartSampleData(x: 1, y: 13),
  ChartSampleData(x: 2, y: 80),
  ChartSampleData(x: 3, y: 30),
  ChartSampleData(x: 4, y: 72),
  ChartSampleData(x: 5, y: 19),
  ChartSampleData(x: 6, y: 30),
  ChartSampleData(x: 7, y: 92),
  ChartSampleData(x: 8, y: 48),
  ChartSampleData(x: 9, y: 20),
  ChartSampleData(x: 10, y: 51),
];
int count = 11;

class _LiveVerticalState extends State<AddDataPoints> {
  _LiveVerticalState(this.sample);
  final SubItem sample;

  @override
  Widget build(BuildContext context) {
    return getScopedModel(null, sample, DynamicPointFrontPanel(sample));
  }
}

SfCartesianChart getAddRemovePointsChart(bool isTileView,
    [List<ChartSampleData> chartData]) {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    primaryXAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift),
    primaryYAxis: NumericAxis(
        axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
    series: getAddRemovePointSeries(chartData),
  );
}

List<ChartSampleData> chartData1 = <ChartSampleData>[
  ChartSampleData(x: 0, y: 10),
  ChartSampleData(x: 1, y: 13),
  ChartSampleData(x: 2, y: 80),
  ChartSampleData(x: 3, y: 30),
  ChartSampleData(x: 4, y: 72),
  ChartSampleData(x: 5, y: 19),
  ChartSampleData(x: 6, y: 30),
  ChartSampleData(x: 7, y: 92),
  ChartSampleData(x: 8, y: 48),
  ChartSampleData(x: 9, y: 20),
  ChartSampleData(x: 10, y: 51),
];
List<LineSeries<ChartSampleData, num>> getAddRemovePointSeries(
    List<ChartSampleData> chartData) {
  return <LineSeries<ChartSampleData, num>>[
    LineSeries<ChartSampleData, num>(
        dataSource: chartData ?? chartData1,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        width: 2),
  ];
}

class DynamicPointFrontPanel extends StatefulWidget {
  //ignore: prefer_const_constructors_in_immutables
  DynamicPointFrontPanel(this.subItemList);
  final SubItem subItemList;

  @override
  _DynamicPointFrontPanelState createState() =>
      _DynamicPointFrontPanelState(subItemList);
}

class _DynamicPointFrontPanelState extends State<DynamicPointFrontPanel> {
  _DynamicPointFrontPanelState(this.sample);
  final SubItem sample;
  num getRandomInt(num min, num max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }

  List<ChartSampleData> getChartData(SampleModel model) {
    chartData.add(ChartSampleData(x: count, y: getRandomInt(10, 100)));
    count = count + 1;
    return chartData;
  }

  List<ChartSampleData> getChartData1(SampleModel model) {
    // ignore: invalid_use_of_protected_member
    if (chartData != null && chartData.isNotEmpty)
      chartData.removeAt(chartData.length - 1);
    count = count - 1;
    return chartData;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SampleModel>(
        rebuildOnChange: true,
        builder: (BuildContext context, _, SampleModel model) {
          return Scaffold(
              backgroundColor: model.cardThemeColor,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                child:
                    Container(child: getAddRemovePointsChart(false, chartData)),
              ),
              floatingActionButton: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: Container(
                      height: 50,
                      width: 120,
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.add_circle,
                                  size: 50, color: model.backgroundColor),
                              onPressed: () => setState(() {
                                chartData = getChartData(model);
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: IconButton(
                                icon: Icon(Icons.remove_circle,
                                    size: 50, color: model.backgroundColor),
                                onPressed: () => setState(() {
                                  chartData = getChartData1(model);
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]));
        });
  }
}
