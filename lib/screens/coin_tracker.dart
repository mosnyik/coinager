import 'package:coinager/utilities/constants.dart';
import 'package:flutter/material.dart';

class CoinTracker extends StatefulWidget {
  const CoinTracker({Key? key}) : super(key: key);

  @override
  _CoinTrackerState createState() => _CoinTrackerState();
}

class _CoinTrackerState extends State<CoinTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Tracker'),
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
