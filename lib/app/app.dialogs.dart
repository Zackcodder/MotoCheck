// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/collect_payment/collect_payment_dialog.dart';
import '../ui/dialogs/notification/notification_dialog.dart';
import '../ui/dialogs/progress/progress_dialog.dart';

enum DialogType {
  collectPayment,
  notification,
  progress,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.collectPayment: (context, request, completer) =>
        CollectPaymentDialog(request: request, completer: completer),
    DialogType.notification: (context, request, completer) =>
        NotificationDialog(request: request, completer: completer),
    DialogType.progress: (context, request, completer) =>
        ProgressDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
