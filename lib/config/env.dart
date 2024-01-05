import 'package:cloud_firestore/cloud_firestore.dart';

class Env {
  final String fdcApiKey;

  // Private constructor
  Env._(this.fdcApiKey);

  // Singleton instance
  static Env? _instance;

  // Getter to access the singleton instance
  static Env get instance {
    if (_instance == null) {
      throw Exception('Env has not been initialized');
    }
    return _instance!;
  }

  // Method to initialize the singleton instance
  static Future<void> initialize() async {
    String apiKey = await getFdcApiKey();
    _instance = Env._(apiKey);
  }
}

Future<String> getFdcApiKey() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('api').get();

  return (snapshot.docs.first.data() as Map<String, dynamic>)['fdcApiKey'];
}
