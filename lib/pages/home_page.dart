import 'package:flutter/material.dart';

import '../components/anyToAny.dart';
import '../functions/fetchrates.dart';
import '../functions/ratesmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<RatesModel> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchrates();
      allcurrencies = fetchcurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Currency Converter"),
        ),
    body:SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 18.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: FutureBuilder<RatesModel>(
                      future: result,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator());
                        }
                        return Center(
                          child: FutureBuilder<Map>(
                              future: allcurrencies,
                              builder: (context, currSnapshot) {
                                if (currSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnyToAny(
                                      currencies: currSnapshot.data!,
                                      rates: snapshot.data!.rates,
                                    ),
                                  ],
                                );
                              }),
                        );
                      },
                    ),
                  ),
                ) )));
  }
}
