import 'package:admin_project/shared/components/custom_shapes.dart';
import 'package:admin_project/shared/components/custom_userslist.dart';
import 'package:admin_project/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/search_cubit.dart';
import 'cubit/search_state.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SearchCubit cubit = SearchCubit.get(context);
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10.0)),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onChanged: (String value) {
                      if (value != null)
                        cubit.searchUser(value);
                    },
                    decoration: InputDecoration(
                      border: outlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                      hintText: ('type to search ...'),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15),),
                  cubit.users.length !=0 ? Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          CustomUserItems(cubit.users[index]),
                      separatorBuilder: (context, index) => CustomDivider(),
                      itemCount: cubit.users.length,
                    ),
                  ):Container(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
