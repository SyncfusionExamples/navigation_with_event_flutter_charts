import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launch;
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final List<ChartSampleData> _chartData = <ChartSampleData>[
    ChartSampleData(x: 'Goldin\nFinance 117', y: 597),
    ChartSampleData(x: 'Ping An\nFinance Center', y: 599),
    ChartSampleData(x: 'Shanghai\nTower', y: 632),
    ChartSampleData(x: 'Burj\nKhalifa', y: 828)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: Container(
            width: 320,
            height: 500,
            child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                backgroundColor: Colors.white,
                primaryXAxis: CategoryAxis(
                    name: 'primaryXAxis',
                    labelIntersectAction: AxisLabelIntersectAction.rotate45,
                    majorGridLines: MajorGridLines(width: 0)),
                primaryYAxis: NumericAxis(
                    minimum: 500,
                    maximum: 900,
                    interval: 100,
                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(size: 0)),
                onAxisLabelTapped: (args) {
                  if (args.axisName == 'primaryXAxis') {
                    if (args.value == 0) {
                      launch(
                          'https://www.emporis.com/buildings/388229/goldin-finance-117-tianjin-china');
                    } else if (args.value == 1) {
                      launch(
                          'https://www.emporis.com/buildings/1189351/ping-an-international-finance-center-shenzhen-china');
                    } else if (args.value == 2) {
                      launch(
                          'https://www.emporis.com/buildings/323473/shanghai-tower-shanghai-china');
                    } else if (args.value == 3) {
                      launch(
                          'https://www.emporis.com/buildings/182168/burj-khalifa-dubai-united-arab-emirates');
                    }
                  }
                },
                series: <ChartSeries<ChartSampleData, String>>[
                  ColumnSeries<ChartSampleData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ChartSampleData data, _) => data.x,
                    yValueMapper: (ChartSampleData data, _) => data.y,
                  )
                ]),
          ),
        ));
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.y});

  final String x;
  final double y;
}
