import 'package:investing_alerts/features/company/domain/entities/company.dart';
import 'package:flutter/material.dart';

class CompanyDisplay extends StatelessWidget {
  final Company company;

  const CompanyDisplay({
    Key key,
    @required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            company.name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Company's PER:",
                      style: TextStyle(fontSize: 23),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 30,),
                    Text(
                      company.per.toString(),
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
