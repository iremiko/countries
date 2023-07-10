import 'package:countries/pages/detail/view/country_detail_page.dart';
import 'package:countries/pages/list/bloc/country_list_bloc.dart';
import 'package:countries/pages/list/bloc/country_list_event.dart';
import 'package:countries/pages/list/bloc/country_list_state.dart';
import 'package:countries/pages/list/model/country_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({Key? key}) : super(key: key);

  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  late CountryListBloc _countryListBloc;

  late double _flagHeight;
  late double _flagWidth;

  @override
  void initState() {
    _countryListBloc = CountryListBloc();

    // We call our event for our api request
    _countryListBloc.add(CountryListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _flagWidth = MediaQuery.of(context).size.width/6;
    _flagHeight = (_flagWidth *9) /16;
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
      ),
      body: BlocListener(
        bloc: _countryListBloc,
        listener: (BuildContext context, CountryListState state) {
          if (state is CountryListErrorState) {
            Fluttertoast.showToast(
                msg: "Something went wrong!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: BlocBuilder<CountryListBloc, CountryListState>(
            bloc: _countryListBloc,
            builder: (BuildContext context, CountryListState state) {
              if (state is CountryListLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ));
              } else if (state is CountryListLoadedState) {
                return ListView.builder(
                    itemCount: state.countryList.length,
                    itemBuilder: (context, index) {
                      CountryList country = state.countryList[index];
                      return Card(
                          elevation: 8,
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetailPage(countryName: country.name?.official ??"")));
                            },
                            leading: Container(
                              height: _flagHeight,
                              width: _flagWidth,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Image.network(
                                country.flags?.png ?? "",
                                height: _flagHeight,
                                width: _flagWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(country.name?.common ?? ""),
                          ));
                    });
              } else if (state is CountryListEmptyState) {
                return Center(
                  child: Text("Seems Empty!"),
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }
}
