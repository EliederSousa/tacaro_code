import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'flutter_barcode_scanner.dart';
import 'main.dart';

class ScreenScanner extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ScreenScanner> {
  String _scanBarcode = 'Desconhecido';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
          alignment: Alignment.center,
          child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => scanBarcodeNormal(),
                  /*style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 206, 134, 0)),
                  )*/

                  style: ElevatedButton.styleFrom(
                    //size: MediaQuery.of(context).size.width * 0.8,
                    primary: Color.fromARGB(255, 184, 110, 26),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(
                      (MediaQuery.of(context).size.width * 0.5).roundToDouble(),
                      50,
                    ),
                  ),
                  child: Text(
                    'Scanear código de barras',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),

                //child: Text('Scanear código de barras')),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Resultado EAN : $_scanBarcode\n',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ]));
    })));
  }
}

/*
Positioned(
                // rectangle2ATU (1:8)
                left: MediaQuery.of(context).size.width * .1,
                top: MediaQuery.of(context).size.height * 0.86,
                child: Align(
                  child: ElevatedButton(
                    onPressed: () {
                      // Adicione sua funcionalidade aqui
                      print('Botão pressionado!');
                    },
                    child: Text(
                      'ENTRAR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      //size: MediaQuery.of(context).size.width * 0.8,
                      primary: Color.fromARGB(255, 143, 87, 23),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(
                        (MediaQuery.of(context).size.width * 0.8)
                            .roundToDouble(),
                        0,
                      ),
                    ),
                  ),
                ),
              ),  */