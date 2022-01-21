import 'package:admin_project/models/user_model.dart';
import 'package:admin_project/screens/search_screen/cubit/search_state.dart';
import 'package:admin_project/shared/constants/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  List users = [];

  SearchCubit() : super(InitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  void searchUser(String username) {
    FirebaseFirestore.instance
        .collection(USERS)
        .where('firstName', isEqualTo: username)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        users.add(UserModel.fromJson(element.data()));
        emit(SearchSuccessfuly());

      });
    }).catchError((error) {
      emit(SearchError(error.toString()));
    });
  }
}
