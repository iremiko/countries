import 'package:countries/pages/detail/bloc/country_detail_bloc.dart';
import 'package:countries/pages/detail/bloc/country_detail_event.dart';
import 'package:countries/pages/detail/bloc/country_detail_state.dart';
import 'package:countries/pages/detail/model/country_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountryDetailPage extends StatefulWidget {
  final String countryName;
  const CountryDetailPage({Key? key, required this.countryName}) : super(key: key);

  @override
  _CountryDetailPageState createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {

  late  CountryDetailBloc _countryDetailBloc;

 late double _flagHeight  ;
 late double _flagWidth ;

  @override
  void initState() {
    _countryDetailBloc = CountryDetailBloc();

    _countryDetailBloc.add(CountryDetailInitialEvent(widget.countryName));


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _flagWidth = MediaQuery.of(context).size.width/2;
    _flagHeight = (_flagWidth *9) /16;
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener(
        bloc: _countryDetailBloc,
        listener: (BuildContext context, CountryDetailState state){
          if(state is CountryDetailErrorState){
            Fluttertoast.showToast(
                msg: "Something went wrong!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        child: BlocBuilder<CountryDetailBloc, CountryDetailState>(
            bloc: _countryDetailBloc,
            builder: (BuildContext context, CountryDetailState state) {
              if (state is CountryDetailLoadingState) {
                return  Center(child: CircularProgressIndicator( backgroundColor: Colors.blue,));
              }
              else if (state is CountryDetailLoadedState) {
                CountryDetail countryDetail = state.countryDetail.first;
                return  ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [

                 Padding(
                   padding: const EdgeInsets.only(bottom: 16.0),
                   child: Center(child: Text(countryDetail.name?.common ?? "", style: Theme.of(context).textTheme.titleLarge, )),
                 ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, ),
                      child: Image.network(countryDetail.flags?.png ?? "", width: _flagWidth, height: _flagHeight, ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Official Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: countryDetail.name?.official ?? ""),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Capital: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: countryDetail.capital?.first ?? ""),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Currency: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: countryDetail.currencies?.name ?? ""),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Population: ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "${countryDetail.population ?? ""}"),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is CountryDetailEmptyState) {
                return Center(
                  child: Text("Seems Empty!"),
                );
              }else{
                return SizedBox();
              }

            }
        ),
      ),
    );
  }
}


