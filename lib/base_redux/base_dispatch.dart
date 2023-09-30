import 'package:flutter/material.dart' as material;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transaction_app/utils/app_contants/app_context.dart';
import 'package:transaction_app/utils/enum/api_enum.dart';
import 'package:transaction_app/utils/enum/status_enum.dart';

import 'base_action.dart';

class BaseDispatch {
  static material.BuildContext context = GlobalContext.currentContext!;

  void _dispatch<T>({required Action action}) {
    StoreProvider.of<T>(context).dispatch(action);
  }

  void dispatchGet<T>({
    required APIsEnum type,
    required ResponseStatus status,
    dynamic payload,
    String error = '',
  }) {
    _dispatch<T>(
      action: ActionGet(
        type: type,
        status: status,
        payloadData: payload,
        error: error,
      ),
    );
  }

  void dispatchPost<T>({
    required APIsEnum type,
    required ResponseStatus status,
    dynamic payload,
    String error = '',
  }) {
    _dispatch<T>(
      action: ActionAdd(
        type: type,
        status: status,
        payloadData: payload,
        error: error,
      ),
    );
  }

  void dispatchUpdate<T>({
    required APIsEnum type,
    required ResponseStatus status,
    dynamic payload,
    String error = '',
  }) {
    _dispatch<T>(
      action: ActionUpdate(
        type: type,
        status: status,
        payloadData: payload,
        error: error,
      ),
    );
  }

  void dispatchDelete<T>({
    required APIsEnum type,
    required ResponseStatus status,
    dynamic payload,
    String error = '',
  }) {
    _dispatch<T>(
      action: ActionDelete(
        type: type,
        status: status,
        payloadData: payload,
        error: error,
      ),
    );
  }
}
