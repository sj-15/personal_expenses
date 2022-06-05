// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_kharcha/trans.dart';
import 'package:intl/intl.dart';

class transactionsList extends StatelessWidget {
  final List<trans> Transactions;
  transactionsList(this.Transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: TextStyle(fontSize: 25),
                ),
                Image.asset('assets/images/waiting1.png'),
              ],
            )
          : ListView.builder(
              itemBuilder: (cnt, idx) {
                return Card(
                  color: Colors.black54,
                  elevation: 15,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 14, 22),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          Transactions[idx].price.toStringAsFixed(2),
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Transactions[idx].title,
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            DateFormat().format(Transactions[idx].dt),
                            style: TextStyle(
                                color: Color.fromARGB(255, 215, 225, 69),
                                fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: Transactions.length,
            ),
    );
  }
}