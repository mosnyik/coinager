import 'package:coinager/network/coin_data.dart';
import 'package:coinager/screens/coin_tracker.dart';
import 'package:coinager/screens/converter_page.dart';
import 'package:coinager/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'NGN';
  CoinData coinData = CoinData();

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];

    for (String currency in currencyList) {
      pickerItems.add(
        Text(
          currency,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currencyList[selectedIndex];
        getCoinData();
        print(selectedCurrency);
      },
      children: pickerItems,
    );
  }

  DropdownButton<String> androidDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String currency in currencyList) {
      String currencyValue = currency;
      var newItem = DropdownMenuItem(
        child: Text(currencyValue),
        value: currencyValue,
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value.toString();
            getCoinData();
            print(selectedCurrency);
          },
        );
      },
    );
  }

  String coinValue = '?';

  void getCoinData() async {
    try {
      var data = await coinData.getCoinData(selectedCurrency);

      setState(() {
        coinValue = data.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        print(e);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  @override
  Widget build(BuildContext context) {
    coinData.getCoinData(selectedCurrency);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cionager'),
        backgroundColor: kThemeColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(50.0, 18.0, 18.0, 0.0),
                child: Text(
                  'Ticker',
                  style: kIntroTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 9.0),
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      child: Text(
                        '1 BTC = $coinValue $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: kTickerCardStyle,
                      ),
                    ),
                  ),
                  color: kThemeColor,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(50.0, 10.0, 18.0, 0.0),
                child: Text(
                  'Converter',
                  style: kIntroTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 9.0, 18.0, 9.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Converter()));
                  },
                  child: Card(
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 10,
                        ),
                        child: Text(
                          'Converter',
                          textAlign: TextAlign.center,
                          style: kCardStyle,
                        ),
                      ),
                    ),
                    color: kThemeColor,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(50.0, 10.0, 18.0, 0.0),
                child: Text(
                  'Coin Tracker',
                  style: kIntroTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 9.0, 18.0, 9.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CoinTracker(),
                      ),
                    );
                  },
                  child: Card(
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 10,
                        ),
                        child: Text(
                          'Coin Tracker',
                          textAlign: TextAlign.center,
                          style: kCardStyle,
                        ),
                      ),
                    ),
                    color: kThemeColor,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            color: kThemeColor,
            child: Platform.isIOS ? iOSPicker() : androidDropDownButton(),
          ),
        ],
      ),
    );
  }
}
