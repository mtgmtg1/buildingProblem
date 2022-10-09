import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class HomeinsSampleFirebaseUser {
  HomeinsSampleFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

HomeinsSampleFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HomeinsSampleFirebaseUser> homeinsSampleFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<HomeinsSampleFirebaseUser>(
      (user) {
        currentUser = HomeinsSampleFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
