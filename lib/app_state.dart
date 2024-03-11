import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _SauvegarderPost = prefs
              .getStringList('ff_SauvegarderPost')
              ?.map((path) => path.ref)
              .toList() ??
          _SauvegarderPost;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _SauvegarderPost = [];
  List<DocumentReference> get SauvegarderPost => _SauvegarderPost;
  set SauvegarderPost(List<DocumentReference> value) {
    _SauvegarderPost = value;
    prefs.setStringList(
        'ff_SauvegarderPost', value.map((x) => x.path).toList());
  }

  void addToSauvegarderPost(DocumentReference value) {
    _SauvegarderPost.add(value);
    prefs.setStringList(
        'ff_SauvegarderPost', _SauvegarderPost.map((x) => x.path).toList());
  }

  void removeFromSauvegarderPost(DocumentReference value) {
    _SauvegarderPost.remove(value);
    prefs.setStringList(
        'ff_SauvegarderPost', _SauvegarderPost.map((x) => x.path).toList());
  }

  void removeAtIndexFromSauvegarderPost(int index) {
    _SauvegarderPost.removeAt(index);
    prefs.setStringList(
        'ff_SauvegarderPost', _SauvegarderPost.map((x) => x.path).toList());
  }

  void updateSauvegarderPostAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _SauvegarderPost[index] = updateFn(_SauvegarderPost[index]);
    prefs.setStringList(
        'ff_SauvegarderPost', _SauvegarderPost.map((x) => x.path).toList());
  }

  void insertAtIndexInSauvegarderPost(int index, DocumentReference value) {
    _SauvegarderPost.insert(index, value);
    prefs.setStringList(
        'ff_SauvegarderPost', _SauvegarderPost.map((x) => x.path).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
