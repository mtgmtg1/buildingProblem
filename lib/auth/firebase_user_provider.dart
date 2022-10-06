import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class CHMSAppFirebaseUser {
  CHMSAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CHMSAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CHMSAppFirebaseUser> cHMSAppFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CHMSAppFirebaseUser>(
      (user) {
        currentUser = CHMSAppFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
