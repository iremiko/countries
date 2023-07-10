import 'dart:async';
import 'package:countries/api/api_call.dart';
import 'package:countries/pages/list/bloc/country_list_event.dart';
import 'package:countries/pages/list/bloc/country_list_state.dart';
import 'package:countries/pages/list/model/country_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CountryListBloc extends Bloc<CountryListEvent, CountryListState>{
  CountryListBloc():super(CountryListInitialState()){
    on<CountryListInitialEvent>(getCountryList);
  }


  Future<void> getCountryList(CountryListInitialEvent event, Emitter<CountryListState> emit) async{
    emit(CountryListLoadingState());
    try{
      List<CountryList> countryList = await ApiCall().getCountryList();

      if(countryList.isNotEmpty){
        emit(CountryListLoadedState(countryList));
      }else{
        emit(CountryListEmptyState());
      }
    }catch(e){
      emit(CountryListErrorState());
    }
  }
}