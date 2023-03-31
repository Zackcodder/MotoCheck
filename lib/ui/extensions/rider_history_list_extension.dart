import 'package:transiter_driver/models/ride_history_model.dart';
import 'package:transiter_driver/ui/extensions/string_extension.dart';

extension RiderHistoryListExtension on List<RideHistoryModel> {
  String tripDate(int index) {
    if (isEmpty || this[index].tripDate == null) {
      return 'N/A';
    }
    return this[index]
        .tripDate!
        .turnToDateTime('dd-MM-yyy')
        .toString()
        .turnStringToDate('dd MMM, yyyy');
  }

  String pickupTime(int index) {
    if (isEmpty || this[index].pickupTime == null) {
      return 'N/A';
    }
    return this[index].pickupTime!;
  }

  String destination(int index) {
    if (isEmpty || this[index].destination == null) {
      return 'N/A';
    }
    return this[index].destination!;
  }

  String amount(int index) {
    if (isEmpty || this[index].amount == null) {
      return 'N/A';
    }
    return this[index].amount!.formatCurrency();
  }

  String tripStatus(int index) {
    if (isEmpty || this[index].tripStatus == null) {
      return '';
    }
    return this[index].tripStatus!;
  }
}
