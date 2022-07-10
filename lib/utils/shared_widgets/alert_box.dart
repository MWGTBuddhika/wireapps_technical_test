import 'package:flutter/cupertino.dart';

import '../../core/router/router_delegate.dart';
import '../strings/common_strings.dart';
import 'custom_snack_bar/custom_snack_bar.dart';
import 'custom_snack_bar/top_snack_bar.dart';

class AlertBox{
  void showError(String error){
    showTopSnackBar(
      assignmentRouter.navigatorKey.currentContext!,
      CustomSnackBar.error(
        message:
        error,
      ),
    );
  }
  void showInfo(String info){
    showTopSnackBar(
      assignmentRouter.navigatorKey.currentContext!,
      CustomSnackBar.info(
        message:
        info,
      ),
    );
  }
  void showSuccess(String success){
    showTopSnackBar(
      assignmentRouter.navigatorKey.currentContext!,
      CustomSnackBar.success(
        message:
        success,
      ),
    );
  }
}