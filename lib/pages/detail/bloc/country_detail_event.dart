abstract class CountryDetailEvent{
  const CountryDetailEvent();
}

class CountryDetailInitialEvent extends CountryDetailEvent{
  final String countryName;
  const CountryDetailInitialEvent(this.countryName);
}
