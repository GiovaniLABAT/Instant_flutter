import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class Post2Record extends FirestoreRecord {
  Post2Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name_event" field.
  String? _nameEvent;
  String get nameEvent => _nameEvent ?? '';
  bool hasNameEvent() => _nameEvent != null;

  // "post" field.
  List<DocumentReference>? _post;
  List<DocumentReference> get post => _post ?? const [];
  bool hasPost() => _post != null;

  // "post_like_by" field.
  List<DocumentReference>? _postLikeBy;
  List<DocumentReference> get postLikeBy => _postLikeBy ?? const [];
  bool hasPostLikeBy() => _postLikeBy != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "id_post" field.
  String? _idPost;
  String get idPost => _idPost ?? '';
  bool hasIdPost() => _idPost != null;

  // "profil_by" field.
  DocumentReference? _profilBy;
  DocumentReference? get profilBy => _profilBy;
  bool hasProfilBy() => _profilBy != null;

  // "user_post" field.
  DocumentReference? _userPost;
  DocumentReference? get userPost => _userPost;
  bool hasUserPost() => _userPost != null;

  // "image_evet" field.
  String? _imageEvet;
  String get imageEvet => _imageEvet ?? '';
  bool hasImageEvet() => _imageEvet != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _nameEvent = snapshotData['name_event'] as String?;
    _post = getDataList(snapshotData['post']);
    _postLikeBy = getDataList(snapshotData['post_like_by']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _idPost = snapshotData['id_post'] as String?;
    _profilBy = snapshotData['profil_by'] as DocumentReference?;
    _userPost = snapshotData['user_post'] as DocumentReference?;
    _imageEvet = snapshotData['image_evet'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('post2')
          : FirebaseFirestore.instance.collectionGroup('post2');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('post2').doc(id);

  static Stream<Post2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Post2Record.fromSnapshot(s));

  static Future<Post2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Post2Record.fromSnapshot(s));

  static Post2Record fromSnapshot(DocumentSnapshot snapshot) => Post2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Post2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Post2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Post2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Post2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPost2RecordData({
  String? image,
  String? description,
  String? nameEvent,
  DateTime? createdTime,
  String? idPost,
  DocumentReference? profilBy,
  DocumentReference? userPost,
  String? imageEvet,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'description': description,
      'name_event': nameEvent,
      'created_time': createdTime,
      'id_post': idPost,
      'profil_by': profilBy,
      'user_post': userPost,
      'image_evet': imageEvet,
    }.withoutNulls,
  );

  return firestoreData;
}

class Post2RecordDocumentEquality implements Equality<Post2Record> {
  const Post2RecordDocumentEquality();

  @override
  bool equals(Post2Record? e1, Post2Record? e2) {
    const listEquality = ListEquality();
    return e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.nameEvent == e2?.nameEvent &&
        listEquality.equals(e1?.post, e2?.post) &&
        listEquality.equals(e1?.postLikeBy, e2?.postLikeBy) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.idPost == e2?.idPost &&
        e1?.profilBy == e2?.profilBy &&
        e1?.userPost == e2?.userPost &&
        e1?.imageEvet == e2?.imageEvet;
  }

  @override
  int hash(Post2Record? e) => const ListEquality().hash([
        e?.image,
        e?.description,
        e?.nameEvent,
        e?.post,
        e?.postLikeBy,
        e?.createdTime,
        e?.idPost,
        e?.profilBy,
        e?.userPost,
        e?.imageEvet
      ]);

  @override
  bool isValidKey(Object? o) => o is Post2Record;
}
