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
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<UserCubit>();
          final cubit2 = context.read<AuthCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            body:
                cubit.profileModel != null
                    ? SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 150,
                                color: Color.fromRGBO(55, 6, 6, 1.0),
                                child: Image.asset("images/WhiteLogo.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 100, left: 130),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    cubit.profileModel!.avatar.toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                             width: 300,
                             height: 300,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all( Radius.circular(40)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'User Name',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromRGBO(55, 6, 6, 0.8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10, width: 10,),
                                        Text(
                                          '${cubit.profileModel!.name}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 35, width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromRGBO(55, 6, 6, 0.8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10, width: 10,),
                                      Text(
                                        '${cubit.profileModel!.email}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        )
                                      )
                                      ],
                                    ),
                                    SizedBox(height: 20, width: 10,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 110),
                            child: ElevatedButton(
                              onPressed: () {
                                cubit2.logout(context);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.logout , size: 20, color: Color.fromRGBO(55, 6, 6, 1),),
                                  SizedBox(width: 20,),
                                  Text('Logout' , style: TextStyle(color: Color.fromRGBO(55, 6, 6, 1)),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          ElevatedButton(
                            onPressed: () async {
                              await CacheNetwork.deleteCacheItem(
                                key: "access_token",
                              );
                              await CacheNetwork.deleteCacheItem(
                                key: "refresh_token",
                              );
                            },
                            child: Text("Logout" , style: TextStyle(color: Color.fromRGBO(55, 6, 6, 1))),
                          ),
                        ],
                      ),
                    ),
          );
        },
      ),
    );
  }
}
