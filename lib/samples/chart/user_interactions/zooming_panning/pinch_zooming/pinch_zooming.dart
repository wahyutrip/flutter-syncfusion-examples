import 'package:syncfusion_flutter_examples/model/helper.dart';
import 'package:syncfusion_flutter_examples/model/model.dart';
import 'package:syncfusion_flutter_examples/widgets/bottom_sheet.dart';
import 'package:syncfusion_flutter_examples/widgets/customDropDown.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

//ignore:must_be_immutable
class DefaultPanning extends StatefulWidget {
  DefaultPanning({this.sample, Key key}) : super(key: key);
  SubItem sample;

  @override
  _DefaultPanningState createState() => _DefaultPanningState(sample);
}

ZoomPanBehavior zoomingBehavior;

class _DefaultPanningState extends State<DefaultPanning> {
  _DefaultPanningState(this.sample);
  final SubItem sample;

  @override
  Widget build(BuildContext context) {
    return getScopedModel(null, sample, PinchZoomingFrontPanel(sample));
  }
}

SfCartesianChart getDefaultPanningChart(bool isTileView,
    [ZoomMode _zoomModeType]) {
  return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: getDefaultPanningSeries(isTileView),
      zoomPanBehavior: zoomingBehavior);
}

List<AreaSeries<ChartSampleData, DateTime>> getDefaultPanningSeries(
    bool isTileView) {
  final List<Color> color = <Color>[];
  color.add(Colors.teal[50]);
  color.add(Colors.teal[200]);
  color.add(Colors.teal);

  final List<double> stops = <double>[];
  stops.add(0.0);
  stops.add(0.5);
  stops.add(1.0);

  final LinearGradient gradientColors =
      LinearGradient(colors: color, stops: stops);
  return <AreaSeries<ChartSampleData, DateTime>>[
    AreaSeries<ChartSampleData, DateTime>(
        dataSource: getDateTimeData(),
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        gradient: gradientColors
        // width: 2
        )
  ];
}

dynamic getDateTimeData() {
  final List<ChartSampleData> randomData = <ChartSampleData>[
    ChartSampleData(x: DateTime(1950, 3, 31), y: 80.7),
    ChartSampleData(x: DateTime(1950, 5, 1), y: 80.2),
    ChartSampleData(x: DateTime(1950, 6, 2), y: 79.3),
    ChartSampleData(x: DateTime(1950, 7, 3), y: 78.6),
    ChartSampleData(x: DateTime(1950, 8, 4), y: 79.5),
    ChartSampleData(x: DateTime(1950, 9, 5), y: 78.9),
    ChartSampleData(x: DateTime(1950, 10, 6), y: 78.2),
    ChartSampleData(x: DateTime(1950, 11, 07), y: 77.4),
    ChartSampleData(x: DateTime(1950, 12, 08), y: 77.6),
    ChartSampleData(x: DateTime(1951, 01, 09), y: 77.7),
    ChartSampleData(x: DateTime(1951, 02, 10), y: 78.4),
    ChartSampleData(x: DateTime(1951, 03, 11), y: 78.6),
    ChartSampleData(x: DateTime(1951, 04, 12), y: 78.8),
    ChartSampleData(x: DateTime(1951, 05, 13), y: 79.4),
    ChartSampleData(x: DateTime(1951, 06, 14), y: 79.0),
    ChartSampleData(x: DateTime(1951, 07, 15), y: 79.9),
    ChartSampleData(x: DateTime(1951, 08, 16), y: 79.8),
    ChartSampleData(x: DateTime(1951, 09, 17), y: 79.2),
    ChartSampleData(x: DateTime(1951, 10, 18), y: 78.5),
    ChartSampleData(x: DateTime(1951, 11, 19), y: 77.9),
    ChartSampleData(x: DateTime(1951, 12, 20), y: 78.2),
    ChartSampleData(x: DateTime(1952, 01, 21), y: 79.1),
    ChartSampleData(x: DateTime(1952, 02, 22), y: 79.5),
    ChartSampleData(x: DateTime(1952, 03, 23), y: 79.6),
    ChartSampleData(x: DateTime(1952, 04, 24), y: 78.8),
    ChartSampleData(x: DateTime(1952, 05, 25), y: 79.4),
    ChartSampleData(x: DateTime(1952, 06, 26), y: 78.7),
    ChartSampleData(x: DateTime(1952, 07, 27), y: 79.0),
    ChartSampleData(x: DateTime(1952, 08, 28), y: 79.6),
    ChartSampleData(x: DateTime(1952, 09, 29), y: 80.4),
    ChartSampleData(x: DateTime(1952, 10, 30), y: 80.9),
    ChartSampleData(x: DateTime(1952, 12, 01), y: 81.1),
    ChartSampleData(x: DateTime(1953, 01, 01), y: 80.3),
    ChartSampleData(x: DateTime(1953, 02, 02), y: 81.0),
    ChartSampleData(x: DateTime(1953, 03, 06), y: 81.1),
    ChartSampleData(x: DateTime(1953, 04, 04), y: 81.2),
    ChartSampleData(x: DateTime(1953, 05, 06), y: 81.9),
    ChartSampleData(x: DateTime(1953, 06, 06), y: 82.9),
    ChartSampleData(x: DateTime(1953, 07, 08), y: 82.9),
    ChartSampleData(x: DateTime(1953, 08, 08), y: 82.8),
    ChartSampleData(x: DateTime(1953, 09, 09), y: 82.1),
    ChartSampleData(x: DateTime(1953, 10, 11), y: 81.5),
    ChartSampleData(x: DateTime(1953, 11, 11), y: 82.0),
    ChartSampleData(x: DateTime(1953, 12, 13), y: 81.2),
    ChartSampleData(x: DateTime(1954, 01, 13), y: 80.6),
    ChartSampleData(x: DateTime(1954, 02, 14), y: 80.2),
    ChartSampleData(x: DateTime(1954, 03, 18), y: 79.4),
    ChartSampleData(x: DateTime(1954, 04, 16), y: 78.4),
    ChartSampleData(x: DateTime(1954, 05, 18), y: 78.8),
    ChartSampleData(x: DateTime(1954, 06, 18), y: 78.0),
    ChartSampleData(x: DateTime(1954, 07, 20), y: 78.5),
    ChartSampleData(x: DateTime(1954, 08, 20), y: 78.9),
    ChartSampleData(x: DateTime(1954, 09, 21), y: 79.1),
    ChartSampleData(x: DateTime(1954, 10, 23), y: 79.1),
    ChartSampleData(x: DateTime(1954, 11, 23), y: 79.3),
    ChartSampleData(x: DateTime(1954, 12, 25), y: 80.2),
    ChartSampleData(x: DateTime(1955, 01, 25), y: 79.7),
    ChartSampleData(x: DateTime(1955, 02, 26), y: 79.8),
    ChartSampleData(x: DateTime(1955, 03, 30), y: 79.3),
    ChartSampleData(x: DateTime(1955, 04, 28), y: 78.3),
    ChartSampleData(x: DateTime(1955, 05, 30), y: 77.4),
    ChartSampleData(x: DateTime(1955, 06, 30), y: 78.0),
    ChartSampleData(x: DateTime(1955, 08, 01), y: 77.0),
    ChartSampleData(x: DateTime(1955, 09, 01), y: 77.6),
    ChartSampleData(x: DateTime(1955, 10, 03), y: 76.7),
    ChartSampleData(x: DateTime(1955, 11, 04), y: 76.5),
    ChartSampleData(x: DateTime(1955, 12, 05), y: 75.8),
    ChartSampleData(x: DateTime(1956, 01, 06), y: 75.2),
    ChartSampleData(x: DateTime(1956, 02, 06), y: 75.8),
    ChartSampleData(x: DateTime(1956, 03, 09), y: 76.3),
    ChartSampleData(x: DateTime(1956, 04, 10), y: 76.9),
    ChartSampleData(x: DateTime(1956, 05, 10), y: 76.3),
    ChartSampleData(x: DateTime(1956, 06, 11), y: 76.3),
    ChartSampleData(x: DateTime(1956, 07, 12), y: 76.6),
    ChartSampleData(x: DateTime(1956, 08, 13), y: 76.1),
    ChartSampleData(x: DateTime(1956, 09, 13), y: 76.3),
    ChartSampleData(x: DateTime(1956, 10, 15), y: 76.6),
    ChartSampleData(x: DateTime(1956, 11, 16), y: 77.3),
    ChartSampleData(x: DateTime(1956, 12, 17), y: 76.6),
    ChartSampleData(x: DateTime(1957, 01, 18), y: 76.6),
    ChartSampleData(x: DateTime(1957, 02, 18), y: 76.6),
    ChartSampleData(x: DateTime(1957, 03, 22), y: 77.4),
    ChartSampleData(x: DateTime(1957, 04, 23), y: 78.2),
    ChartSampleData(x: DateTime(1957, 05, 22), y: 78.0),
    ChartSampleData(x: DateTime(1957, 06, 23), y: 77.1),
    ChartSampleData(x: DateTime(1957, 07, 24), y: 77.6),
    ChartSampleData(x: DateTime(1957, 08, 25), y: 77.1),
    ChartSampleData(x: DateTime(1957, 09, 25), y: 77.4),
    ChartSampleData(x: DateTime(1957, 10, 27), y: 76.4),
    ChartSampleData(x: DateTime(1957, 11, 28), y: 76.7),
    ChartSampleData(x: DateTime(1957, 12, 29), y: 76.6),
    ChartSampleData(x: DateTime(1958, 01, 30), y: 76.7),
    ChartSampleData(x: DateTime(1958, 03, 02), y: 76.1),
    ChartSampleData(x: DateTime(1958, 04, 03), y: 75.4),
    ChartSampleData(x: DateTime(1958, 05, 05), y: 76.1),
    ChartSampleData(x: DateTime(1958, 06, 03), y: 76.6),
    ChartSampleData(x: DateTime(1958, 07, 05), y: 76.9),
    ChartSampleData(x: DateTime(1958, 08, 05), y: 77.9),
    ChartSampleData(x: DateTime(1958, 09, 06), y: 77.5),
    ChartSampleData(x: DateTime(1958, 10, 07), y: 77.5),
    ChartSampleData(x: DateTime(1958, 11, 08), y: 77.5),
    ChartSampleData(x: DateTime(1958, 12, 10), y: 77.3),
    ChartSampleData(x: DateTime(1959, 01, 10), y: 76.6),
    ChartSampleData(x: DateTime(1959, 02, 11), y: 77.0),
    ChartSampleData(x: DateTime(1959, 03, 14), y: 76.5),
    ChartSampleData(x: DateTime(1959, 04, 15), y: 77.4),
    ChartSampleData(x: DateTime(1959, 05, 17), y: 77.8),
    ChartSampleData(x: DateTime(1959, 06, 15), y: 78.3),
    ChartSampleData(x: DateTime(1959, 07, 17), y: 78.3),
    ChartSampleData(x: DateTime(1959, 08, 17), y: 78.9),
    ChartSampleData(x: DateTime(1959, 09, 18), y: 78.9),
    ChartSampleData(x: DateTime(1959, 10, 19), y: 79.3),
    ChartSampleData(x: DateTime(1959, 11, 20), y: 78.9),
    ChartSampleData(x: DateTime(1959, 12, 22), y: 78.7),
    ChartSampleData(x: DateTime(1960, 01, 22), y: 79.0),
    ChartSampleData(x: DateTime(1960, 02, 23), y: 78.4),
    ChartSampleData(x: DateTime(1960, 03, 25), y: 77.8),
    ChartSampleData(x: DateTime(1960, 04, 26), y: 78.6),
    ChartSampleData(x: DateTime(1960, 05, 28), y: 79.5),
    ChartSampleData(x: DateTime(1960, 06, 27), y: 79.1),
    ChartSampleData(x: DateTime(1960, 07, 29), y: 79.6),
    ChartSampleData(x: DateTime(1960, 08, 29), y: 79.3),
    ChartSampleData(x: DateTime(1960, 09, 30), y: 79.2),
    ChartSampleData(x: DateTime(1960, 10, 31), y: 79.4),
    ChartSampleData(x: DateTime(1960, 12, 02), y: 79.7),
    ChartSampleData(x: DateTime(1961, 01, 03), y: 80.5),
    ChartSampleData(x: DateTime(1961, 02, 03), y: 79.5),
    ChartSampleData(x: DateTime(1961, 03, 07), y: 80.3),
    ChartSampleData(x: DateTime(1961, 04, 07), y: 80.1),
    ChartSampleData(x: DateTime(1961, 05, 09), y: 80.3),
    ChartSampleData(x: DateTime(1961, 06, 10), y: 79.5),
    ChartSampleData(x: DateTime(1961, 07, 09), y: 78.9),
    ChartSampleData(x: DateTime(1961, 08, 10), y: 79.2),
    ChartSampleData(x: DateTime(1961, 09, 10), y: 79.6),
    ChartSampleData(x: DateTime(1961, 10, 12), y: 78.6),
    ChartSampleData(x: DateTime(1961, 11, 12), y: 78.8),
    ChartSampleData(x: DateTime(1961, 12, 14), y: 79.8),
    ChartSampleData(x: DateTime(1962, 01, 15), y: 80.3),
    ChartSampleData(x: DateTime(1962, 02, 15), y: 79.5),
    ChartSampleData(x: DateTime(1962, 03, 19), y: 79.5),
    ChartSampleData(x: DateTime(1962, 04, 19), y: 80.2),
    ChartSampleData(x: DateTime(1962, 05, 21), y: 80.0),
    ChartSampleData(x: DateTime(1962, 06, 22), y: 79.1),
    ChartSampleData(x: DateTime(1962, 07, 21), y: 79.1),
    ChartSampleData(x: DateTime(1962, 08, 22), y: 79.3),
    ChartSampleData(x: DateTime(1962, 09, 22), y: 79.1),
    ChartSampleData(x: DateTime(1962, 10, 24), y: 79.6),
    ChartSampleData(x: DateTime(1962, 11, 24), y: 80.3),
    ChartSampleData(x: DateTime(1962, 12, 26), y: 79.9),
    ChartSampleData(x: DateTime(1963, 01, 27), y: 80.1),
    ChartSampleData(x: DateTime(1963, 02, 27), y: 80.4),
    ChartSampleData(x: DateTime(1963, 03, 31), y: 80.5),
    ChartSampleData(x: DateTime(1963, 05, 01), y: 80.0),
    ChartSampleData(x: DateTime(1963, 06, 02), y: 80.4),
    ChartSampleData(x: DateTime(1963, 07, 04), y: 80.3),
    ChartSampleData(x: DateTime(1963, 08, 02), y: 81.3),
    ChartSampleData(x: DateTime(1963, 09, 03), y: 82.0),
    ChartSampleData(x: DateTime(1963, 10, 04), y: 82.3),
    ChartSampleData(x: DateTime(1963, 11, 05), y: 82.6),
    ChartSampleData(x: DateTime(1963, 12, 06), y: 82.4),
    ChartSampleData(x: DateTime(1964, 01, 07), y: 82.1),
    ChartSampleData(x: DateTime(1964, 02, 08), y: 81.5),
    ChartSampleData(x: DateTime(1964, 03, 10), y: 81.1),
    ChartSampleData(x: DateTime(1964, 04, 11), y: 80.2),
    ChartSampleData(x: DateTime(1964, 05, 12), y: 80.0),
    ChartSampleData(x: DateTime(1964, 06, 13), y: 79.2),
    ChartSampleData(x: DateTime(1964, 07, 15), y: 78.7),
    ChartSampleData(x: DateTime(1964, 08, 14), y: 78.0),
    ChartSampleData(x: DateTime(1964, 09, 15), y: 77.3),
    ChartSampleData(x: DateTime(1964, 10, 16), y: 77.9),
    ChartSampleData(x: DateTime(1964, 11, 17), y: 77.8),
    ChartSampleData(x: DateTime(1964, 12, 18), y: 77.0),
    ChartSampleData(x: DateTime(1965, 01, 19), y: 77.1),
    ChartSampleData(x: DateTime(1965, 02, 20), y: 78.0),
    ChartSampleData(x: DateTime(1965, 03, 23), y: 78.5),
    ChartSampleData(x: DateTime(1965, 04, 24), y: 78.8),
    ChartSampleData(x: DateTime(1965, 05, 25), y: 79.5),
    ChartSampleData(x: DateTime(1965, 06, 26), y: 80.2),
    ChartSampleData(x: DateTime(1965, 07, 28), y: 81.0),
    ChartSampleData(x: DateTime(1965, 08, 26), y: 80.2),
    ChartSampleData(x: DateTime(1965, 09, 27), y: 79.3),
    ChartSampleData(x: DateTime(1965, 10, 28), y: 79.4),
    ChartSampleData(x: DateTime(1965, 11, 29), y: 79.5),
    ChartSampleData(x: DateTime(1965, 12, 30), y: 79.6),
    ChartSampleData(x: DateTime(1966, 01, 31), y: 79.1),
    ChartSampleData(x: DateTime(1966, 03, 04), y: 79.8),
    ChartSampleData(x: DateTime(1966, 04, 04), y: 78.8),
    ChartSampleData(x: DateTime(1966, 05, 06), y: 79.6),
    ChartSampleData(x: DateTime(1966, 06, 06), y: 80.2),
    ChartSampleData(x: DateTime(1966, 07, 08), y: 79.2),
    ChartSampleData(x: DateTime(1966, 08, 09), y: 78.5),
    ChartSampleData(x: DateTime(1966, 09, 07), y: 77.5),
    ChartSampleData(x: DateTime(1966, 10, 09), y: 78.0),
    ChartSampleData(x: DateTime(1966, 11, 09), y: 78.5),
    ChartSampleData(x: DateTime(1966, 12, 11), y: 78.1),
    ChartSampleData(x: DateTime(1967, 01, 11), y: 77.3),
    ChartSampleData(x: DateTime(1967, 02, 12), y: 76.7),
    ChartSampleData(x: DateTime(1967, 03, 16), y: 76.0),
    ChartSampleData(x: DateTime(1967, 04, 16), y: 76.6),
    ChartSampleData(x: DateTime(1967, 05, 18), y: 76.3),
    ChartSampleData(x: DateTime(1967, 06, 18), y: 76.0),
    ChartSampleData(x: DateTime(1967, 07, 20), y: 76.5),
    ChartSampleData(x: DateTime(1967, 08, 21), y: 76.6),
    ChartSampleData(x: DateTime(1967, 09, 19), y: 77.3),
    ChartSampleData(x: DateTime(1967, 10, 21), y: 76.8),
    ChartSampleData(x: DateTime(1967, 11, 21), y: 77.8),
    ChartSampleData(x: DateTime(1967, 12, 23), y: 77.6),
    ChartSampleData(x: DateTime(1968, 01, 23), y: 77.6),
    ChartSampleData(x: DateTime(1968, 02, 24), y: 76.9),
    ChartSampleData(x: DateTime(1968, 03, 27), y: 76.0),
    ChartSampleData(x: DateTime(1968, 04, 27), y: 76.8),
    ChartSampleData(x: DateTime(1968, 05, 29), y: 75.9),
    ChartSampleData(x: DateTime(1968, 06, 29), y: 76.3),
    ChartSampleData(x: DateTime(1968, 07, 31), y: 75.5),
    ChartSampleData(x: DateTime(1968, 09, 01), y: 75.3),
    ChartSampleData(x: DateTime(1968, 10, 01), y: 75.0),
    ChartSampleData(x: DateTime(1968, 11, 02), y: 75.3),
    ChartSampleData(x: DateTime(1968, 12, 03), y: 74.8),
    ChartSampleData(x: DateTime(1969, 01, 04), y: 74.4),
    ChartSampleData(x: DateTime(1969, 02, 04), y: 74.1),
    ChartSampleData(x: DateTime(1969, 03, 08), y: 74.4),
    ChartSampleData(x: DateTime(1969, 04, 09), y: 74.6),
    ChartSampleData(x: DateTime(1969, 05, 10), y: 75.1),
    ChartSampleData(x: DateTime(1969, 06, 11), y: 74.9),
    ChartSampleData(x: DateTime(1969, 07, 12), y: 75.4),
    ChartSampleData(x: DateTime(1969, 08, 13), y: 76.0),
    ChartSampleData(x: DateTime(1969, 09, 14), y: 76.4),
    ChartSampleData(x: DateTime(1969, 10, 13), y: 76.7),
    ChartSampleData(x: DateTime(1969, 11, 14), y: 76.7),
    ChartSampleData(x: DateTime(1969, 12, 15), y: 77.0),
    ChartSampleData(x: DateTime(1970, 01, 16), y: 77.9),
    ChartSampleData(x: DateTime(1970, 02, 16), y: 77.9),
    ChartSampleData(x: DateTime(1970, 03, 20), y: 78.8),
    ChartSampleData(x: DateTime(1970, 04, 21), y: 79.1),
    ChartSampleData(x: DateTime(1970, 05, 22), y: 79.0),
    ChartSampleData(x: DateTime(1970, 06, 23), y: 78.7),
    ChartSampleData(x: DateTime(1970, 07, 24), y: 78.3),
    ChartSampleData(x: DateTime(1970, 08, 25), y: 78.3),
    ChartSampleData(x: DateTime(1970, 09, 26), y: 79.1),
    ChartSampleData(x: DateTime(1970, 10, 25), y: 78.1),
    ChartSampleData(x: DateTime(1970, 11, 26), y: 77.9),
    ChartSampleData(x: DateTime(1970, 12, 27), y: 77.2),
    ChartSampleData(x: DateTime(1971, 01, 28), y: 77.2),
    ChartSampleData(x: DateTime(1971, 02, 28), y: 76.2),
    ChartSampleData(x: DateTime(1971, 04, 01), y: 76.3),
    ChartSampleData(x: DateTime(1971, 05, 03), y: 75.6),
    ChartSampleData(x: DateTime(1971, 06, 03), y: 75.1),
    ChartSampleData(x: DateTime(1971, 07, 05), y: 74.5),
    ChartSampleData(x: DateTime(1971, 08, 05), y: 74.6),
    ChartSampleData(x: DateTime(1971, 09, 06), y: 75.2),
    ChartSampleData(x: DateTime(1971, 10, 08), y: 74.5),
    ChartSampleData(x: DateTime(1971, 11, 06), y: 74.7),
    ChartSampleData(x: DateTime(1971, 12, 08), y: 74.7),
    ChartSampleData(x: DateTime(1972, 01, 08), y: 75.2),
    ChartSampleData(x: DateTime(1972, 02, 09), y: 75.5),
    ChartSampleData(x: DateTime(1972, 03, 11), y: 76.3),
    ChartSampleData(x: DateTime(1972, 04, 12), y: 75.7),
    ChartSampleData(x: DateTime(1972, 05, 14), y: 76.5),
    ChartSampleData(x: DateTime(1972, 06, 14), y: 77.5),
    ChartSampleData(x: DateTime(1972, 07, 16), y: 78.3),
    ChartSampleData(x: DateTime(1972, 08, 16), y: 79.0),
    ChartSampleData(x: DateTime(1972, 09, 17), y: 80.0),
    ChartSampleData(x: DateTime(1972, 10, 19), y: 80.4),
    ChartSampleData(x: DateTime(1972, 11, 18), y: 80.5),
    ChartSampleData(x: DateTime(1972, 12, 20), y: 79.5),
    ChartSampleData(x: DateTime(1973, 01, 20), y: 78.9),
    ChartSampleData(x: DateTime(1973, 02, 21), y: 79.5),
    ChartSampleData(x: DateTime(1973, 03, 24), y: 80.5),
    ChartSampleData(x: DateTime(1973, 04, 25), y: 79.6),
    ChartSampleData(x: DateTime(1973, 05, 27), y: 80.6),
    ChartSampleData(x: DateTime(1973, 06, 27), y: 81.4),
    ChartSampleData(x: DateTime(1973, 07, 29), y: 81.2),
    ChartSampleData(x: DateTime(1973, 08, 29), y: 81.1),
    ChartSampleData(x: DateTime(1973, 09, 30), y: 81.3),
    ChartSampleData(x: DateTime(1973, 11, 01), y: 81.3),
    ChartSampleData(x: DateTime(1973, 11, 30), y: 80.6),
    ChartSampleData(x: DateTime(1974, 01, 01), y: 81.0),
    ChartSampleData(x: DateTime(1974, 02, 01), y: 81.6),
    ChartSampleData(x: DateTime(1974, 03, 05), y: 80.9),
    ChartSampleData(x: DateTime(1974, 04, 05), y: 80.0),
    ChartSampleData(x: DateTime(1974, 05, 07), y: 80.8),
    ChartSampleData(x: DateTime(1974, 06, 08), y: 81.0),
    ChartSampleData(x: DateTime(1974, 07, 09), y: 80.7),
    ChartSampleData(x: DateTime(1974, 08, 10), y: 80.4),
    ChartSampleData(x: DateTime(1974, 09, 10), y: 79.9),
    ChartSampleData(x: DateTime(1974, 10, 12), y: 79.3),
    ChartSampleData(x: DateTime(1974, 11, 13), y: 78.7),
    ChartSampleData(x: DateTime(1974, 12, 12), y: 77.9),
    ChartSampleData(x: DateTime(1975, 01, 13), y: 78.4),
    ChartSampleData(x: DateTime(1975, 02, 13), y: 77.4),
    ChartSampleData(x: DateTime(1975, 03, 17), y: 78.0),
    ChartSampleData(x: DateTime(1975, 04, 17), y: 77.9),
    ChartSampleData(x: DateTime(1975, 05, 19), y: 77.8),
    ChartSampleData(x: DateTime(1975, 06, 20), y: 78.3),
    ChartSampleData(x: DateTime(1975, 07, 21), y: 79.2),
    ChartSampleData(x: DateTime(1975, 08, 22), y: 79.9),
    ChartSampleData(x: DateTime(1975, 09, 22), y: 79.1),
    ChartSampleData(x: DateTime(1975, 10, 24), y: 79.1),
    ChartSampleData(x: DateTime(1975, 11, 25), y: 79.2),
    ChartSampleData(x: DateTime(1975, 12, 24), y: 78.3),
    ChartSampleData(x: DateTime(1976, 01, 25), y: 77.6),
    ChartSampleData(x: DateTime(1976, 02, 25), y: 78.3),
    ChartSampleData(x: DateTime(1976, 03, 28), y: 78.0),
    ChartSampleData(x: DateTime(1976, 04, 28), y: 78.0),
    ChartSampleData(x: DateTime(1976, 05, 30), y: 78.6),
    ChartSampleData(x: DateTime(1976, 07, 01), y: 79.5),
    ChartSampleData(x: DateTime(1976, 08, 01), y: 79.1),
    ChartSampleData(x: DateTime(1976, 09, 02), y: 79.9),
    ChartSampleData(x: DateTime(1976, 10, 03), y: 79.9),
    ChartSampleData(x: DateTime(1976, 11, 04), y: 79.0),
    ChartSampleData(x: DateTime(1976, 12, 06), y: 79.3),
    ChartSampleData(x: DateTime(1977, 01, 05), y: 78.7),
    ChartSampleData(x: DateTime(1977, 02, 06), y: 78.9),
    ChartSampleData(x: DateTime(1977, 03, 09), y: 79.9),
    ChartSampleData(x: DateTime(1977, 04, 10), y: 80.5),
    ChartSampleData(x: DateTime(1977, 05, 11), y: 79.7),
    ChartSampleData(x: DateTime(1977, 06, 12), y: 80.7),
    ChartSampleData(x: DateTime(1977, 07, 14), y: 81.6),
    ChartSampleData(x: DateTime(1977, 08, 14), y: 82.6),
    ChartSampleData(x: DateTime(1977, 09, 15), y: 82.1),
    ChartSampleData(x: DateTime(1977, 10, 16), y: 83.1),
    ChartSampleData(x: DateTime(1977, 11, 17), y: 82.9),
    ChartSampleData(x: DateTime(1977, 12, 19), y: 83.0),
    ChartSampleData(x: DateTime(1978, 01, 17), y: 82.1),
    ChartSampleData(x: DateTime(1978, 02, 18), y: 82.0),
    ChartSampleData(x: DateTime(1978, 03, 21), y: 82.0),
  ];
  return randomData;
}

//ignore:must_be_immutable
class PinchZoomingFrontPanel extends StatefulWidget {
  //ignore: prefer_const_constructors_in_immutables
  PinchZoomingFrontPanel(this.subItemList);
  SubItem subItemList;
  @override
  _PinchZoomingFrontPanelState createState() =>
      _PinchZoomingFrontPanelState(subItemList);
}

class _PinchZoomingFrontPanelState extends State<PinchZoomingFrontPanel> {
  _PinchZoomingFrontPanelState(this.sample);
  final SubItem sample;

  final List<String> _zoomModeTypeList = <String>['x', 'y', 'xy'].toList();
  String _selectedModeType = 'x';
  ZoomMode _zoomModeType = ZoomMode.x;

  @override
  Widget build(BuildContext context) {
    zoomingBehavior = ZoomPanBehavior(
        enablePinching: true, zoomMode: _zoomModeType, enablePanning: true);
    return ScopedModelDescendant<SampleModel>(
        rebuildOnChange: true,
        builder: (BuildContext context, _, SampleModel model) {
          return Scaffold(
              backgroundColor: model.cardThemeColor,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                child: Container(
                    child: getDefaultPanningChart(false, _zoomModeType)),
              ),
              floatingActionButton: Container(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {
                        _showSettingsPanel(model);
                      },
                      child: Icon(Icons.graphic_eq, color: Colors.white),
                      backgroundColor: model.backgroundColor,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    FloatingActionButton(
                      heroTag: false,
                      onPressed: () {
                        zoomingBehavior.reset();
                      },
                      child: Icon(Icons.refresh, color: Colors.white),
                      backgroundColor: model.backgroundColor,
                    )
                  ],
                ),
              ));
        });
  }

  void _showSettingsPanel(SampleModel model) {
    showRoundedModalBottomSheet<dynamic>(
        dismissOnTap: false,
        context: context,
        radius: 12.0,
        color: model.bottomSheetBackgroundColor,
        builder: (BuildContext context) => ScopedModelDescendant<SampleModel>(
            rebuildOnChange: false,
            builder: (BuildContext context, _, SampleModel model) => Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: 120,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 40,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Settings',
                                        style: TextStyle(
                                            color: model.textColor,
                                            fontSize: 18,
                                            letterSpacing: 0.34,
                                            fontWeight: FontWeight.w500)),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: model.textColor,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 50, 0, 0),
                                child: ListView(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text('Zoom mode ',
                                              style: TextStyle(
                                                  color: model.textColor,
                                                  fontSize: 16,
                                                  letterSpacing: 0.34,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 40, 0),
                                            height: 50,
                                            width: 150,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Theme(
                                                  data: Theme.of(context).copyWith(
                                                      canvasColor: model
                                                          .bottomSheetBackgroundColor),
                                                  child: DropDown(
                                                      value: _selectedModeType,
                                                      item: _zoomModeTypeList
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                                String>(
                                                            value:
                                                                (value != null)
                                                                    ? value
                                                                    : 'x',
                                                            child: Text(
                                                                '$value',
                                                                style: TextStyle(
                                                                    color: model
                                                                        .textColor)));
                                                      }).toList(),
                                                      valueChanged:
                                                          (dynamic value) {
                                                        onZoomTypeChange(
                                                            value, model);
                                                      })),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ))));
  }

  void onZoomTypeChange(String item, SampleModel model) {
    setState(() {
      _selectedModeType = item;
      if (_selectedModeType == 'x') {
        _zoomModeType = ZoomMode.x;
      }
      if (_selectedModeType == 'y') {
        _zoomModeType = ZoomMode.y;
      }
      if (_selectedModeType == 'xy') {
        _zoomModeType = ZoomMode.xy;
      }
    });
  }
}
