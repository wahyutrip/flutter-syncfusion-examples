import 'package:syncfusion_flutter_examples/widgets/bottom_sheet.dart';
import 'package:syncfusion_flutter_examples/widgets/customDropDown.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_examples/model/model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../model/helper.dart';
import '../../../../model/model.dart';

//ignore: must_be_immutable
class SplineTypes extends StatefulWidget {
  SplineTypes({this.sample, Key key}) : super(key: key);
  SubItem sample;

  @override
  _SplineTypesState createState() => _SplineTypesState(sample);
}

class _SplineTypesState extends State<SplineTypes> {
  _SplineTypesState(this.sample);
  SubItem sample;

  @override
  Widget build(BuildContext context) {
    return getScopedModel(null, sample, SplineTypesFrontPanel(sample));
  }
}

SfCartesianChart getTypesSplineChart(bool isTileView,
    [SplineType _splineType]) {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(text: isTileView ? '' : 'Export growth of Brazil'),
    primaryXAxis: NumericAxis(
      majorGridLines: MajorGridLines(width: 0),
      interval: 1,
    ),
    primaryYAxis: NumericAxis(
        labelFormat: '{value}%',
        minimum: -0.1,
        maximum: 0.2,
        interval: 0.1,
        majorTickLines: MajorTickLines(size: 0)),
    series: getSplineTypesSeries(isTileView, _splineType),
    tooltipBehavior:
        TooltipBehavior(enable: true, header: '', canShowMarker: false),
  );
}

List<SplineSeries<_ChartData, num>> getSplineTypesSeries(bool isTileView,
    [SplineType _splineType]) {
  final List<_ChartData> chartData = <_ChartData>[
    _ChartData(2011, 0.05),
    _ChartData(2011.25, 0),
    _ChartData(2011.50, 0.03),
    _ChartData(2011.75, 0),
    _ChartData(2012, 0.04),
    _ChartData(2012.25, 0.02),
    _ChartData(2012.50, -0.01),
    _ChartData(2012.75, 0.01),
    _ChartData(2013, -0.08),
    _ChartData(2013.25, -0.02),
    _ChartData(2013.50, 0.03),
    _ChartData(2013.75, 0.05),
    _ChartData(2014, 0.04),
    _ChartData(2014.25, 0.02),
    _ChartData(2014.50, 0.04),
    _ChartData(2014.75, 0),
    _ChartData(2015, 0.02),
    _ChartData(2015.25, 0.10),
    _ChartData(2015.50, 0.09),
    _ChartData(2015.75, 0.11),
    _ChartData(2016, 0.12),
  ];
  return <SplineSeries<_ChartData, num>>[
    SplineSeries<_ChartData, num>(
        enableTooltip: true,
        splineType: _splineType,
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        width: 2)
  ];
}

class _ChartData {
  _ChartData(this.x, this.y);
  final double x;
  final double y;
}

//ignore: must_be_immutable
class SplineTypesFrontPanel extends StatefulWidget {
  //ignore:prefer_const_constructors_in_immutables
  SplineTypesFrontPanel(this.subItemList);
  SubItem subItemList;

  @override
  _SplineTypesFrontPanelState createState() =>
      _SplineTypesFrontPanelState(subItemList);
}

class _SplineTypesFrontPanelState extends State<SplineTypesFrontPanel> {
  _SplineTypesFrontPanelState(this.sample);
  final SubItem sample;

  final List<String> _splineList =
      <String>['natural', 'monotonic', 'cardinal', 'clamped'].toList();
  String _selectedSplineType = 'natural';
  SplineType _spline = SplineType.natural;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SampleModel>(
        rebuildOnChange: true,
        builder: (BuildContext context, _, SampleModel model) {
          return Scaffold(
              backgroundColor: model.cardThemeColor,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                child: Container(child: getTypesSplineChart(false, _spline)),
              ),
              floatingActionButton: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                      child: Container(
                        height: 50,
                        width: 250,
                        child: InkWell(
                          onTap: () => launch(
                              'https://tcdata360.worldbank.org/indicators/ex.grw?country=BRA&indicator=401&viz=line_chart&years=2010Q3,2016Q2'),
                          child: Row(
                            children: <Widget>[
                              Text('Source: ',
                                  style: TextStyle(
                                      fontSize: 16, color: model.textColor)),
                              Text('tcdata360.worldbank.org',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        _showSettingsPanel(model);
                      },
                      child: Icon(Icons.graphic_eq, color: Colors.white),
                      backgroundColor: model.backgroundColor,
                    ),
                  ),
                ],
              ));
        });
  }

  void onPositionTypeChange(String item, SampleModel model) {
    setState(() {
      _selectedSplineType = item;
      if (_selectedSplineType == 'natural') {
        _spline = SplineType.natural;
      }
      if (_selectedSplineType == 'monotonic') {
        _spline = SplineType.monotonic;
      }
      if (_selectedSplineType == 'cardinal') {
        _spline = SplineType.cardinal;
      }
      if (_selectedSplineType == 'clamped') {
        _spline = SplineType.clamped;
      }
    });
  }

  void _showSettingsPanel(SampleModel model) {
    final double height =
        (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width)
            ? 0.3
            : 0.4;
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
                    height: 140,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * height,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                              child: Stack(children: <Widget>[
                                Container(
                                  height: 40,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      const EdgeInsets.fromLTRB(10, 50, 0, 0),
                                  child: ListView(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Text('Spline type ',
                                                style: TextStyle(
                                                    color: model.textColor,
                                                    fontSize: 16,
                                                    letterSpacing: 0.34,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 0, 0),
                                                height: 50,
                                                width: 150,
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            canvasColor: model
                                                                .bottomSheetBackgroundColor),
                                                    child: DropDown(
                                                        value:
                                                            _selectedSplineType,
                                                        item: _splineList.map(
                                                            (String value) {
                                                          return DropdownMenuItem<
                                                                  String>(
                                                              value: (value !=
                                                                      null)
                                                                  ? value
                                                                  : 'natural',
                                                              child: Text(
                                                                  '$value',
                                                                  style: TextStyle(
                                                                      color: model
                                                                          .textColor)));
                                                        }).toList(),
                                                        valueChanged:
                                                            (dynamic value) {
                                                          onPositionTypeChange(
                                                              value.toString(),
                                                              model);
                                                        }),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            )))))));
  }
}
