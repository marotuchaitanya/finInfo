import 'package:fin_project/models/profile_model.dart';
import 'package:fin_project/services/profile_services.dart';
import 'package:fin_project/util_constants/constants.dart';
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
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final user = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: /* Image.network(
                    user.imageUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Error loading image');
                    },
                  ), */
                      CircleAvatar(radius: 40, backgroundImage: NetworkImage(user.imageUrl)),
                  title: Text(user.fullName),
                  subtitle: Text(user.location),
                ),
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
