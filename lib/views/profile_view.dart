import 'package:fin_project/models/profile_model.dart';
import 'package:fin_project/services/profile_services.dart';
import 'package:fin_project/util_constants/constants.dart';
import 'package:fin_project/util_constants/shimmer_effect.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<User> futureUser;
  ProfileService profileView = ProfileService();

  @override
  void initState() {
    futureUser = profileView.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 310,
      clipBehavior: Clip.none,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      elevation: 0,
      child: FutureBuilder(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerEffectView(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              baseColor: Colors.grey,
              primaryColor: Colors.black,
              highLightColor: Colors.blueGrey,
              width: 310,
              height: MediaQuery.of(context).size.height,
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final user = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                      width: 60,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage((user.imageUrl))))),
                  title: Text(user.fullName),
                  subtitle: Text(user.location),
                ),
                const Divider(),
                ListTile(
                  title: Text('Email: ${user.email}', style: style),
                ),
                ListTile(
                  title: Text('DOB: ${user.dob.day}/${user.dob.month}/${user.dob.year}'),
                ),
                ListTile(
                  title: Text('Days since registered: ${user.daysSinceRegistered}'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
