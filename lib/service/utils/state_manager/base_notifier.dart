

/*
 * add mounted option to stop calling build methods after disposal
 */
import 'package:flutter/cupertino.dart';
import 'package:minafarma/service/api/http_api.dart';
import 'package:minafarma/service/utils/state_manager/provider_setup.dart';

enum NotifierState { busy, idle, error }

class BaseNotifier extends ChangeNotifier {
  NotifierState _state = NotifierState.idle;
  bool _mounted = true;
  final HttpApi api = locator<HttpApi>();

  BaseNotifier({NotifierState? state}) {
    if (state != null) _state = state;
  }

  bool get mounted => _mounted;
  NotifierState get state => _state;
  bool get idle => _state == NotifierState.idle;
  bool get busy => _state == NotifierState.busy;
  bool get hasError => _state == NotifierState.error;

  setBusy() => setState(state: NotifierState.busy);
  setIdle() => setState(state: NotifierState.idle);
  setError() => setState(state: NotifierState.error);

  setState({NotifierState? state, bool notifyListener = true}) {
    print("set state is called");
    if (state != null) _state = state;
    if (mounted && notifyListener) notifyListeners();
    notifyListeners();
  }

  @override
  dispose() {
    _mounted = false;
    debugPrint(
        '*************** \n\n -- ${this.runtimeType} Provider Has Disposed -- \n\n***************');
    super.dispose();
  }
}
