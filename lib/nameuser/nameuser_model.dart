import '/flutter_flow/flutter_flow_util.dart';
import 'nameuser_widget.dart' show NameuserWidget;
import 'package:flutter/material.dart';

class NameuserModel extends FlutterFlowModel<NameuserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Name_create widget.
  FocusNode? nameCreateFocusNode;
  TextEditingController? nameCreateController;
  String? Function(BuildContext, String?)? nameCreateControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    nameCreateFocusNode?.dispose();
    nameCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
