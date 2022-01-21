abstract class SearchStates {}
class InitialState extends SearchStates{}
class SearchSuccessfuly extends SearchStates{}
class SearchError extends SearchStates{
  String error;

  SearchError(this.error);
}
