import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstraction over connectivity checking.
///
/// Depending on this interface (rather than `connectivity_plus` directly)
/// inside the repository keeps the data layer testable - tests can
/// provide a fake [NetworkInfo] without touching platform channels.
abstract interface class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this._connectivity);

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> result =
        await _connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }
}
