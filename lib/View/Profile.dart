import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/UserProfile/user_cubit.dart';
import '../Shared/Network/local_network.dart';
import '../controller/Auth/auth_cubit.dart';


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
          final cubit = context.read<UserCubit>();
          final cubit2 = context.read<AuthCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  "Profile",
                  style: ,
                  ),
            ),
            body: cubit.profileModel != null ?
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       CircleAvatar(
                         radius: 50,
                         backgroundImage: NetworkImage(cubit.profileModel!.avatar.toString()),
                       ),
                       SizedBox(height: 20),
                       Text(
                         'User Name',
                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                       ),
                       Text(
                         '${cubit.profileModel!.name}',
                         style: TextStyle(fontSize: 20),
                       ),
                       SizedBox(height: 10),
                       Text('Email' ,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
                       Text(
                         '${cubit.profileModel!.email}',
                         style: TextStyle(fontSize: 20),
                       ),
                       SizedBox(height: 10),
                       ElevatedButton(
                         onPressed: (){
                             cubit2.logout(context);

                         },
                         child: Text('Logout'),
                       ),
                     ],
                   ) :
                   Column(children: [CircularProgressIndicator(),ElevatedButton(
            onPressed: () async {
              await CacheNetwork.deleteCacheItem(key: "access_token");
              await CacheNetwork.deleteCacheItem(key: "refresh_token");
            },
            child: Text("Logout"),
          )],)
          );
        },
      ),
    );
  }
}
