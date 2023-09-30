import 'package:transaction_app/utils/enum/api_enum.dart';
import 'package:transaction_app/utils/enum/status_enum.dart';

class Action {
  dynamic payloadData;
  APIsEnum? type;
  ResponseStatus? status;
  String? error = '';

  Action({
    this.payloadData,
    this.type,
    this.status,
    this.error,
  });
}

class ActionGet extends Action {
  ActionGet({
    dynamic payloadData,
    APIsEnum? type,
    ResponseStatus? status,
    String? error,
  }) : super(
          payloadData: payloadData,
          type: type,
          status: status,
          error: error,
        );
}

class ActionAdd extends Action {
  ActionAdd({
    dynamic payloadData,
    APIsEnum? type,
    ResponseStatus? status,
    String? error,
  }) : super(
          payloadData: payloadData,
          type: type,
          status: status,
          error: error,
        );
}

class ActionUpdate extends Action {
  ActionUpdate({
    dynamic payloadData,
    APIsEnum? type,
    ResponseStatus? status,
    String? error,
  }) : super(
          payloadData: payloadData,
          type: type,
          status: status,
          error: error,
        );
}

class ActionDelete extends Action {
  ActionDelete({
    dynamic payloadData,
    APIsEnum? type,
    ResponseStatus? status,
    String? error,
  }) : super(
          payloadData: payloadData,
          type: type,
          status: status,
          error: error,
        );
}
