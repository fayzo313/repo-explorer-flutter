import 'dart:async';

/// Debounces rapid calls (e.g. keystrokes in a search field) so we don't
/// fire a network/DB request on every character typed.
class Debouncer {
  Debouncer(this.delay);

  final Duration delay;
  Timer? _timer;

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
