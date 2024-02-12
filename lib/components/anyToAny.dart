import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class AnyToAny extends StatefulWidget {
  final rates;
  final Map currencies;

  const AnyToAny({super.key, this.rates, required this.currencies});

  @override
  _AnyToAnyState createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amountController = TextEditingController();

  String dropdownValue1 = 'INR';
  String dropdownValue2 = 'USD';
  String answer = 'Eyes Here!!';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/bgimg.png"),
            SizedBox(height: 20),
            TextFormField(
              key: ValueKey('amount'),
              controller: amountController,
              decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  labelStyle: TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.white,),
              style: TextStyle(color: Colors.orange),

              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue1,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20.0),
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('To')),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue2,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20.0),
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = amountController.text +
                          ' ' +
                          dropdownValue1 +
                          ' ' +
                          convertany(widget.rates, amountController.text,
                              dropdownValue1, dropdownValue2) +
                          ' ' +
                          dropdownValue2;
                    });
                  },
                  child: Text('Convert', style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: Colors.white,),
              height: 50,
              width: 1000,

                child: Center(child: Text(answer,style: TextStyle(color: Colors.orange, fontSize: 30),)))
          ],
        ),
      ),
    );
  }
}
