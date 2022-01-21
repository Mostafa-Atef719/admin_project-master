import 'package:admin_project/models/user_model.dart';
import 'package:admin_project/screens/profile_edit/components/body.dart';
import 'package:admin_project/screens/profile_screen/cubit/profile_screen_cubit.dart';
import 'package:admin_project/screens/profile_screen/cubit/profile_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  UserModel userModel;

  EditProfileScreen(this.userModel);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var phoneNumber = TextEditingController();
  var address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileScreenCubit,ProfileScreenState>(
      listener:(context,state){},
      builder:(context,state){
        return  Scaffold(
          appBar: AppBar(),
          body: Body(userModel ,ProfileScreenCubit.get(context) ),
        );
      },
    );
  }
}
