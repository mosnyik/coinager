import 'package:coinager/utilities/constants.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
        backgroundColor: kThemeColor,
      ),
      body: Column(
        children: [
          Card(
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Text(
                  'text',
                  textAlign: TextAlign.center,
                  style: kTickerCardStyle,
                ),
              ),
            ),
            color: kThemeColor,
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          Card(
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Text(
                  'text',
                  textAlign: TextAlign.center,
                  style: kTickerCardStyle,
                ),
              ),
            ),
            color: kThemeColor,
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          Card(
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Text(
                  'text',
                  textAlign: TextAlign.center,
                  style: kTickerCardStyle,
                ),
              ),
            ),
            color: kThemeColor,
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
