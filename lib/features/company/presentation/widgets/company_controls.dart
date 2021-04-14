import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investing_alerts/features/company/presentation/bloc/company/company_bloc.dart';

class SearchControls extends StatefulWidget {
  const SearchControls({
    Key key,
  }) : super(key: key);

  @override
  _SearchControlsState createState() => _SearchControlsState();
}

class _SearchControlsState extends State<SearchControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a company symbol. E.g. IBM',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            searchCompany();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)))),
                onPressed: searchCompany,
              ),
            ),
            SizedBox(width: 10),
          ],
        )
      ],
    );
  }

  void searchCompany() {
    controller.clear();
    BlocProvider.of<CompanyBloc>(context).add(GetCompanyPer(inputStr));
  }
}
