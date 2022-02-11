import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/login/login.dart';
import 'package:test/services/auth.dart';

import '../services/models.dart';
import '../shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;
    var report = Provider.of<Report?>(context);

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(user.displayName ?? 'Guest'),
        ),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(top: 50, bottom: 15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(user.photoURL ?? 'https://via.placeholder.com/150'),
                          )),
                    ),
                    Text(
                      user.email ?? "",
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Nb of quizzes completed : '),
                    report?.total != null ? Text('${report!.total}') : const Text('0'),
                  ],
                ),
                LoginButton(
                    color: const Color.fromARGB(255, 194, 155, 12),
                    icon: FontAwesomeIcons.signOutAlt,
                    text: 'Log Out',
                    login: () async {
                      AuthService().signOut;
                      Navigator.pushNamed(context, 'login');
                    }),
              ]),
        ),
        bottomNavigationBar: const BottomNav(),
      );
    } else {
      return const LoginScreen();
    }
  }
}
