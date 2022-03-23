import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:task_zero/widgets/custom_big_photo_widget.dart';
import 'package:task_zero/widgets/custom_container_widget.dart';
import 'package:task_zero/widgets/custom_logo_widget.dart';
import 'package:task_zero/widgets/custom_photo_widget.dart';
import 'package:task_zero/widgets/custom_text_widget.dart';

void main() {
  runApp(const MaterialApp(home: MyTaskZero()));
}

class MyTaskZero extends StatefulWidget {
  const MyTaskZero({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MyTaskZero> {
  final _borderRadius = BorderRadius.circular(0.0);
  var _borderWidth = 2.0;
  var _randomInt = 0;
  var _randomShadowColor = const Color(0xff443a11);
  var _shadowSpread = 10.0;

  final List<Color> _randomColor = [
    Colors.teal,
    Colors.green,
    Colors.deepPurple,
    Colors.cyan,
    Colors.blue,
    Colors.lightGreen,
    Colors.purple
  ];
  List images = [
    'lib/img/travel.jpg',
    'lib/img/moto.jpg',
    'lib/img/mountains.jpg'
  ];

  Widget changeColorAlertDialog(int id) {
    Color selectedColor = const Color(0xff443a49);

    void changeColor(Color newColor) {
      setState(() {
        selectedColor = newColor;
      });
    }

    return AlertDialog(
      title: Row(children: const [
        Icon(Icons.format_paint),
        Text(' Wybierz kolor'),
      ]),
      content: SingleChildScrollView(
        child: MaterialPicker(
          pickerColor: _randomColor[id],
          onColorChanged: changeColor,
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Anuluj'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Zatwierdź'),
          onPressed: () {
            setState(() {
              _randomColor[id] = selectedColor;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void randomBorderWidth() {
    _borderWidth = Random().nextInt(20).toDouble();
  }

  void randomColor() {
    for (int i = 0; i <= 6; i++) {
      _randomColor[i] =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
    }
  }

  void randomShadowColor() {
    _randomShadowColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  void randomInt() {
    _randomInt = Random().nextInt(3);
  }

  // void changeColor(Color color) {
  //   setState(() => _randomColor[0] = color);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.black45, Colors.blue, Colors.black87],
          begin: Alignment(-1, -0.5),
          end: Alignment(1, 0.8),
        )),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    if (details.delta.dx > 5) {
                      setState(() {
                        randomColor();
                      });
                    } else if (details.delta.dx < -5) {
                      setState(() {
                        randomShadowColor();
                      });
                    } else if (details.delta.dy > 5) {
                      setState(() {
                        if (_shadowSpread >= 0) {
                          _shadowSpread -= (details.delta.dy / 10);
                        }
                      });
                    } else if (details.delta.dy < -5) {
                      setState(() {
                        if (_shadowSpread <= 40) {
                          _shadowSpread += (details.delta.dy / (-10));
                        }
                      });
                    }
                  },
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: _borderRadius,
                      boxShadow: [
                        BoxShadow(
                          color: _randomShadowColor,
                          spreadRadius: _shadowSpread,
                          blurRadius: 9,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(50),
                    duration: const Duration(seconds: 2),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //First Column
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 2,
                                        child: GestureDetector(
                                          onLongPress: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return changeColorAlertDialog(
                                                      0);
                                                });
                                          },
                                          child: CustomContainer(
                                            customColor: _randomColor[0],
                                            borderWidth: 1.0,
                                            duration: 3,
                                            child: Row(
                                              children: const [
                                                Expanded(
                                                  child: CustomText(
                                                      customTitle:
                                                          'Sprawdź mnie!\n',
                                                      customText:
                                                          'Przesuń po siatce palcem góra-dół oraz lewo-prawo, aby zobaczyć zmiany, przytrzymaj kwadrat, żeby wybrać jego kolor'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            randomBorderWidth();
                                          });
                                        },
                                        onLongPress: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return changeColorAlertDialog(
                                                    1);
                                              });
                                        },
                                        child: CustomContainer(
                                          customColor: _randomColor[1],
                                          borderWidth: _borderWidth,
                                          duration: 2,
                                          child: const FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Icon(Icons.monitor,
                                                  size: 50)),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            //Second Column
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: GestureDetector(
                                      onLongPress: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return changeColorAlertDialog(2);
                                            });
                                      },
                                      child: CustomContainer(
                                        customColor: _randomColor[2],
                                        borderWidth: 1.0,
                                        duration: 2,
                                        child: const FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Michał',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              letterSpacing: 4,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: GestureDetector(
                                      onLongPress: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return changeColorAlertDialog(3);
                                            });
                                      },
                                      child: CustomContainer(
                                          customColor: _randomColor[3],
                                          borderWidth: 1.0,
                                          duration: 2,
                                          child: const CustomPhotoWidget(
                                              image: 'lib/img/myPhoto.jpg',
                                              fit: BoxFit.fitWidth)),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: GestureDetector(
                                        onDoubleTap: () {
                                          setState(() {
                                            randomInt();
                                          });
                                        },
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CustomBigPhoto(
                                                          images: images,
                                                          id: _randomInt)));
                                          const snackBar = SnackBar(
                                            content: Text(
                                                'Podwójne kliknięcie kwadratu ze zdjęciem, spowoduje wylosowanie kolejnego zdjęcia'),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        onLongPress: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return changeColorAlertDialog(
                                                    4);
                                              });
                                        },
                                        child: CustomContainer(
                                            customColor: _randomColor[4],
                                            borderWidth: 1.0,
                                            duration: 2,
                                            child: CustomPhotoWidget(
                                                image: images[_randomInt],
                                                fit: BoxFit.fitHeight)),
                                      )),
                                ],
                              ),
                            ),
                            //Third Column
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onLongPress: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return changeColorAlertDialog(
                                                    5);
                                              });
                                        },
                                        child: CustomContainer(
                                          customColor: _randomColor[5],
                                          borderWidth: 1.0,
                                          duration: 2,
                                          child: const FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Icon(Icons.motorcycle,
                                                  size: 50)),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                      onLongPress: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return changeColorAlertDialog(6);
                                            });
                                      },
                                      child: CustomContainer(
                                        customColor: _randomColor[6],
                                        borderWidth: 1.0,
                                        duration: 2,
                                        child: Row(
                                          children: const [
                                            Expanded(
                                              child: CustomText(
                                                  customTitle:
                                                      'Czego oczekuję od BootCampu?\n',
                                                  customText:
                                                      '\nChciałbym zobaczyć jak wygląda codzienna praca programistów,'
                                                      ' zdobyć nowe doświadczenie oraz wiedzę,'
                                                      ' a także ustalić dalszy kierunek nauki'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: CustomLogo(),
            )
          ],
        ),
      ),
    );
  }
}
