import 'package:flutter/material.dart';

/// Reusable, debounced-by-caller search field with a trailing clear
/// button. Kept "dumb" (no debounce logic inside it) - the caller
/// (Home screen) owns the [Debouncer] so this widget stays trivially
/// reusable and testable.
class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    required this.onChanged,
    required this.onSubmitted,
    this.hintText = 'Search GitHub repositories…',
    super.key,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final String hintText;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.search,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (context, value, _) {
            if (value.text.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () {
                _controller.clear();
                widget.onChanged('');
              },
            );
          },
        ),
      ),
    );
  }
}
