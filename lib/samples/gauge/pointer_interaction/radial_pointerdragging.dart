import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_examples/widgets/flutter_backdrop.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/model.dart';

// ignore: must_be_immutable
class RadialPointerDragging extends StatefulWidget {
  RadialPointerDragging({this.sample, Key key}) : super(key: key);
  SubItem sample;

  @override
  _RadialPointerDraggingState createState() =>
      _RadialPointerDraggingState(sample);
}

class _RadialPointerDraggingState extends State<RadialPointerDragging> {
  _RadialPointerDraggingState(this.sample);
  final SubItem sample;
  final ValueNotifier<bool> frontPanelVisible = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SampleModel>(
        builder: (BuildContext context, _, SampleModel model) => SafeArea(
              child: Backdrop(
                needCloseButton: false,
                panelVisible: frontPanelVisible,
                sampleListModel: model,
                frontPanelOpenPercentage: 0.28,
                toggleFrontLayer: false,
                appBarAnimatedLeadingMenuIcon: AnimatedIcons.close_menu,
                appBarActions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        icon: Image.asset(model.codeViewerIcon,
                            color: Colors.white),
                        onPressed: () {
                          launch(
                              'https://github.com/syncfusion/flutter-examples/blob/master/lib/samples/gauge/pointer_interaction/radial_pointerdragging.dart');
                        },
                      ),
                    ),
                  ),
                ],
                appBarTitle: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1000),
                    child: Text(sample.title.toString())),
                backLayer: BackPanel(sample),
                frontLayer: FrontPanel(sample),
                sideDrawer: null,
                headerClosingHeight: 350,
                titleVisibleOnPanelClosed: true,
                color: model.cardThemeColor,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12), bottom: Radius.circular(0)),
              ),
            ));
  }
}

class FrontPanel extends StatefulWidget {
  //ignore:prefer_const_constructors_in_immutables
  FrontPanel(this.subItemList);
  final SubItem subItemList;

  @override
  _FrontPanelState createState() => _FrontPanelState(subItemList);
}

class _FrontPanelState extends State<FrontPanel> {
  _FrontPanelState(this.sample);
  final SubItem sample;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _firstMarkerSize = 10;
      _annotationFontSize = 25;
    } else {
      _firstMarkerSize = 5;
      _annotationFontSize = 15;
    }
    return ScopedModelDescendant<SampleModel>(
        rebuildOnChange: true,
        builder: (BuildContext context, _, SampleModel model) {
          return Scaffold(
              backgroundColor: model.cardThemeColor,
              body: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 7, // takes 30% of available width
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              axisLineStyle: AxisLineStyle(
                                  thickness: 0.2,
                                  thicknessUnit: GaugeSizeUnit.factor),
                              showTicks: false,
                              showLabels: true,
                              onAxisTapped: onPointerValueChanged,
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: _currentValue,
                                    onValueChanged: onPointerValueChanged,
                                    onValueChangeEnd: onPointerValueChanged,
                                    onValueChanging: onPointerValueChanging,
                                    enableDragging: true,
                                    width: 0.2,
                                    sizeUnit: GaugeSizeUnit.factor),
                                MarkerPointer(
                                  value: _markerValue,
                                  color: Colors.white,
                                  markerHeight: _firstMarkerSize,
                                  markerWidth: _firstMarkerSize,
                                  markerType: MarkerType.circle,
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Row(
                                      children: <Widget>[
                                        Text(
                                          '$_annotationValue',
                                          style: TextStyle(
                                              fontSize: _annotationFontSize,
                                              fontFamily: 'Times',
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF00A8B5)),
                                        ),
                                        Text(
                                          ' %',
                                          style: TextStyle(
                                              fontSize: _annotationFontSize,
                                              fontFamily: 'Times',
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF00A8B5)),
                                        )
                                      ],
                                    ),
                                    positionFactor: 0.13,
                                    angle: 0)
                              ])
                        ]),
                      ),
                      Expanded(
                        flex: 3, // takes 30% of available width
                        child: Slider(
                          activeColor: const Color(0xFF02AAB0),
                          inactiveColor: const Color(0xFF00CDAC),
                          min: 5,
                          max: 100,
                          onChanged: onPointerValueChanged,
                          value: _currentValue,
                        ),
                      ),
                    ],
                  )));
        });
  }

  void onPointerValueChanged(double value) {
    if (value.toInt() > 6) {
      setState(() {
        _currentValue = value.roundToDouble();
        final int _value = _currentValue.toInt();
        _annotationValue = '$_value';
        _markerValue = _currentValue - 2;
      });
    }
  }

  void onPointerValueChanging(ValueChangingArgs args) {
    if (args.value.toInt() <= 6) {
      args.cancel = true;
    }
  }
}

class BackPanel extends StatefulWidget {
  //ignore:prefer_const_constructors_in_immutables
  BackPanel(this.sample);
  final SubItem sample;

  @override
  _BackPanelState createState() => _BackPanelState(sample);
}

class _BackPanelState extends State<BackPanel> {
  _BackPanelState(this.sample);
  final SubItem sample;
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(dynamic _) {
    _getSizesAndPosition();
  }

  void _getSizesAndPosition() {
    final RenderBox renderBoxRed = _globalKey.currentContext.findRenderObject();
    final Size size = renderBoxRed.size;
    final Offset position = renderBoxRed.localToGlobal(Offset.zero);
    const double appbarHeight = 60;
    BackdropState.frontPanelHeight =
        position.dy + (size.height - appbarHeight) + 20;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SampleModel>(
      rebuildOnChange: true,
      builder: (BuildContext context, _, SampleModel model) {
        return Container(
          color: model.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  sample.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.white,
                      letterSpacing: 0.53),
                ),
                Padding(
                  key: _globalKey,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    sample.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.white,
                        letterSpacing: 0.3,
                        height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget getRadialPointerDragging(bool isTileView) {
  return SfRadialGauge(axes: <RadialAxis>[
    RadialAxis(
        axisLineStyle:
            AxisLineStyle(thickness: 0.2, thicknessUnit: GaugeSizeUnit.factor),
        showTicks: false,
        showLabels: false,
        radiusFactor: 1,
        pointers: <GaugePointer>[
          RangePointer(
              value: _currentValue, width: 0.2, sizeUnit: GaugeSizeUnit.factor),
          MarkerPointer(
            value: _markerValue,
            color: Colors.white,
            markerHeight: 5,
            markerWidth: 5,
            markerType: MarkerType.circle,
          ),
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Row(
                children: <Widget>[
                  Text(
                    '$_annotationValue',
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00A8B5)),
                  ),
                  const Text(
                    ' %',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00A8B5)),
                  )
                ],
              ),
              positionFactor: 0.13,
              angle: 0)
        ])
  ]);
}

double _currentValue = 60;
double _markerValue = 58;
double _firstMarkerSize = 10;
double _annotationFontSize = 25;
String _annotationValue = '60';
