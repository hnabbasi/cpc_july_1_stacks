import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stacks Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 6;
    final width = MediaQuery.of(context).size.width / 6;

    final TextStyle headingStyle = TextStyle(
        color: Colors.black54,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none);

    final TextStyle subHeadingStyle = TextStyle(
        color: Colors.black45,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none);

    final TextStyle companyTextStyle = TextStyle(
        color: Colors.black38,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // background
        Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade300, Colors.orange.shade200],
              ),
            )),
        // badge card
        Container(
          margin: EdgeInsets.fromLTRB(width, height, width, height),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          // bg colors - blue and white
          child: Stack(
            overflow: Overflow.clip,
            alignment: Alignment.topCenter,
            children: [
              Column(children: [
                Expanded(
                    flex: 1,
                    child: Stack(
                        overflow: Overflow.clip,
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                color: Colors.blue.shade700),
                          ),
                          CustomPaint(
                            painter: DrawDiagonalLines(width, height),
                            size: Size(24, 24),
                          )
                        ])),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
                            child: Text("Hussain Abbasi", style: headingStyle)),
                        Container(
                            padding: EdgeInsets.fromLTRB(30, 25, 30, 10),
                            child: Text(
                              "Head of Technology @ ChaiOne | Developer | Blogger | Speaker | Xamarin Certified | Founder intelliAbb Inc",
                              style: subHeadingStyle,
                              textAlign: TextAlign.center,
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(30, 25, 30, 10),
                            child: Text(
                              'ChaiOne',
                              style: companyTextStyle,
                              textAlign: TextAlign.center,
                            )),
                        Spacer(),
                        OutlineButton(
                          child: Text("View Profile"),
                          textColor: Colors.blue.shade700,
                          color: Colors.blue.shade700,
                          onPressed: () => {},
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                            child: Image(
                                width: 80,
                                image: NetworkImage(
                                    "http://woikr.com/wp/wp-content/uploads/2010/09/LinkedIn_logo.png")))
                      ],
                    )),
              ]),
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.fromLTRB(width, height - 50, width, height),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C4E03AQEyGJS_lEWosA/profile-displayphoto-shrink_400_400/0?e=1599696000&v=beta&t=5dHO-S3LFEBCCX-dKxQ6m_KNnVbammFN_ZZlcT9K-1s'),
                      fit: BoxFit.cover),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class SemiCircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    Rect rect =
        Rect.fromLTRB(-size.width, 10.0, size.width / 2, size.height + 10);
    return rect;
  }

  @override
  bool shouldReclip(SemiCircleClipper oldClipper) {
    return true;
  }
}

class DrawDiagonalLines extends CustomPainter {
  Paint _paint;
  double _x;
  double _y;

  DrawDiagonalLines(double startX, double startY) {
    _x = startX;
    _y = startY;

    _paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(1, 15), Offset(_x * 4, _y * 2), _paint);
    canvas.drawLine(Offset(1, 19), Offset(_x * 1.5, _y * 2), _paint);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(0, 24),
        height: 24,
        width: 24,
      ),
      -math.pi / 2,
      math.pi,
      true,
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
