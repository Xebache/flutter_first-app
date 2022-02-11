import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/services/auth.dart';
import 'package:test/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((snapshot) => snapshot.data());
    var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }

  Future<Quiz> getQuiz(String id) async {
    var ref = _db.collection('quizzes').doc(id);
    var snapshot = await ref.get();
    return Quiz.fromJson(snapshot.data() ?? {});
  }

  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('users').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('report').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'topic': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      }
    };
    return ref.set(data, SetOptions(merge: true));
  }
}
