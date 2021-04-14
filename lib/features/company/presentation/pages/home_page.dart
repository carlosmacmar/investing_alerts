import 'package:investing_alerts/features/company/presentation/bloc/company/company_bloc.dart';
import 'package:investing_alerts/features/company/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Stocks Data'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<CompanyBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<CompanyBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<CompanyBloc, CompanyState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(message: 'Start searching companies!');
                  } else if (state is Loaded) {
                    return CompanyDisplay(company: state.company);
                  } else if (state is Error) {
                    return MessageDisplay(message: state.message);
                  } else {
                    return LoadingWidget();
                  }
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              SearchControls()
            ],
          ),
        ),
      ),
    );
  }
}
