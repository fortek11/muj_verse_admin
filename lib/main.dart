import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/homepage.dart';
import 'package:try_flutter_web/navigating_state.dart';
import 'package:try_flutter_web/new_event/new_event_screen.dart';

import 'package:try_flutter_web/profile_screen.dart';

import 'package:try_flutter_web/redirect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAjwWzHEXPx1nfuZMgrQzRzCMIj0d0iB6g",
          appId: "1:622528948609:web:caaf0d20b19a25da7a2080",
          messagingSenderId: "622528948609",
          storageBucket: "gs://muj-verse-beta.appspot.com",
          projectId: "muj-verse-beta"));
  runApp(WebPortal());
}

class WebPortal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataState()),
        ChangeNotifierProvider(create: (context) => NavigatingState())
      ],
      child: MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.openSansTextTheme(),
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0xFF1D2228), primary: Color(0xFF1D2228))),
        home: Redirect(),
        routes: {
          ProfileScreen.routeName: (context) => ProfileScreen(),
          HomePage.routeName: (context) => HomePage(),
          NewEventScreen.routeName: (context) => NewEventScreen()
        },
      ),
    );
  }
}
