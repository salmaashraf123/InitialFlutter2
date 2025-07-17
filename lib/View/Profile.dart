import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/UserProfile/user_cubit.dart';

import '../Routes/routes.dart';
import '../Shared/Network/local_network.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          final cubit = BlocProvider.of<UserCubit>(context);
          return Scaffold(
            appBar: AppBar(title: Text("Profile"),),
            body: cubit.profileModel != null ?
                   Column(
                     children: [
                       Text(cubit.profileModel!.name!),
                       SizedBox(height: 20,),
                       Text(cubit.profileModel!.email!),
                     ],
                   ) :
                   Column(children: [CircularProgressIndicator(),ElevatedButton(
            onPressed: () async {
              await CacheNetwork.deleteCacheItem(key: "access_token");
              await CacheNetwork.deleteCacheItem(key: "refresh_token");
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.loginPage,
                    (route) => false,
              );
            },
            child: Text("Logout"),
          )],)
          );
        },
      ),
    );
  }
}
