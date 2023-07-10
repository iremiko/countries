import 'package:countries/api/api_call.dart';
import 'package:countries/pages/detail/bloc/country_detail_event.dart';
import 'package:countries/pages/detail/bloc/country_detail_state.dart';
import 'package:countries/pages/detail/model/country_detail_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailBloc extends Bloc<CountryDetailEvent, CountryDetailState>{
  CountryDetailBloc():super(CountryDetailInitialState()){
    on<CountryDetailInitialEvent>(getCountryDetail);
  }


  Future<void> getCountryDetail(CountryDetailInitialEvent event, Emitter<CountryDetailState> emit) async{
    emit(CountryDetailLoadingState());
    try{
      List<CountryDetail> countryDetail = await ApiCall().getCountryDetail(event.countryName);

      if(countryDetail.isNotEmpty){
        emit(CountryDetailLoadedState(countryDetail));
      }else{
        emit(CountryDetailEmptyState());
      }
    }catch(e){
      emit(CountryDetailErrorState());
    }
  }
}