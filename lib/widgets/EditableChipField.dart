import 'dart:async';

import 'package:flutter/material.dart';

class EditableChipField extends StatefulWidget {
  const EditableChipField({
    Key? key,
    required this.initialValues,
    required this.hintText,
    required this.toppingsList, // Add this line
  }) : super(key: key);

  final List<String> initialValues;
  final String hintText;
  final List<String> toppingsList; // Add this line

  @override
  EditableChipFieldExampleState createState() =>
      EditableChipFieldExampleState();
}

class EditableChipFieldExampleState extends State<EditableChipField> {
  final FocusNode _chipFocusNode = FocusNode();
  List<String> _toppings = <String>[];
  List<String> _suggestions = <String>[];

  @override
  void initState() {
    super.initState();
    //_toppings = widget.initialValues;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          _suggestions.isNotEmpty ? MediaQuery.of(context).size.height : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ChipsInput<String>(
            values: _toppings,
            hintText: widget.hintText,
            strutStyle: const StrutStyle(fontSize: 15),
            onChanged: _onChanged,
            onSubmitted: _onSubmitted,
            chipBuilder: _chipBuilder,
            onTextChanged: _onSearchChanged,
          ),
          if (_suggestions.isNotEmpty)
            Flexible(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ToppingSuggestion(
                    _suggestions[index],
                    onTap: _selectSuggestion,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _onSearchChanged(String value) async {
    final List<String> results =
        await _suggestionCallback(value, widget.toppingsList);
    setState(() {
      _suggestions = results
          .where((String topping) => !_toppings.contains(topping))
          .toList();
    });
  }

  Widget _chipBuilder(BuildContext context, String topping) {
    return ToppingInputChip(
      topping: topping,
      onDeleted: _onChipDeleted,
      onSelected: _onChipTapped,
    );
  }

  void _selectSuggestion(String topping) {
    setState(() {
      _toppings.add(topping);
      _suggestions = <String>[];
    });
  }

  void _onChipTapped(String topping) {}

  void _onChipDeleted(String topping) {
    setState(() {
      _toppings.remove(topping);
      _suggestions = <String>[];
    });
  }

  void _onSubmitted(String text) {
    if (text.trim().isNotEmpty) {
      setState(() {
        _toppings = <String>[..._toppings, text.trim()];
      });
    } else {
      _chipFocusNode.unfocus();
    }
  }

  void _onChanged(List<String> data) {
    setState(() {
      _toppings = data;
    });
  }

  FutureOr<List<String>> _suggestionCallback(
      String text, List<String> toppingsList) {
    if (text.isNotEmpty) {
      return toppingsList.where((String topping) {
        return topping.toLowerCase().contains(text.toLowerCase());
      }).toList();
    }
    return const <String>[];
  }

  @override
  void dispose() {
    _chipFocusNode.dispose();
    super.dispose();
  }
}

class ChipsInput<T> extends StatefulWidget {
  const ChipsInput({
    Key? key,
    required this.values,
    required this.hintText,
    this.decoration = const InputDecoration(),
    this.style,
    this.strutStyle,
    required this.chipBuilder,
    required this.onChanged,
    this.onChipTapped,
    this.onSubmitted,
    this.onTextChanged,
  }) : super(key: key);

  final List<T> values;
  final String hintText;
  final InputDecoration decoration;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final ValueChanged<List<T>> onChanged;
  final ValueChanged<T>? onChipTapped;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onTextChanged;

  final Widget Function(BuildContext context, T data) chipBuilder;

  @override
  ChipsInputState<T> createState() => ChipsInputState<T>();
}

class ChipsInputState<T> extends State<ChipsInput<T>> {
  late final ChipsInputEditingController<T> controller;

  @override
  void initState() {
    super.initState();
    controller = ChipsInputEditingController<T>(
      <T>[...widget.values],
      widget.chipBuilder,
    );
    controller.addListener(_textListener);
  }

  @override
  void dispose() {
    controller.removeListener(_textListener);
    controller.dispose();
    super.dispose();
  }

  void _textListener() {
    final String currentText = controller.text;

    final int currentNumber = countReplacements(currentText);
    final int previousNumber = countReplacements(controller.previousText);

    final int cursorEnd = controller.selection.extentOffset;
    final int cursorStart = controller.selection.baseOffset;

    final List<T> values = <T>[...widget.values];

    if (currentNumber < previousNumber && currentNumber != values.length) {
      if (cursorStart == cursorEnd) {
        values.removeRange(cursorStart - 1, cursorEnd);
      } else {
        if (cursorStart > cursorEnd) {
          values.removeRange(cursorEnd, cursorStart);
        } else {
          values.removeRange(cursorStart, cursorEnd);
        }
      }
      widget.onChanged(values);
    }

    controller.previousText = currentText;
  }

  static int countReplacements(String text) {
    return text.codeUnits
        .where(
            (int u) => u == ChipsInputEditingController.kObjectReplacementChar)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    controller.updateValues(<T>[...widget.values]);

    return TextField(
      minLines: 1,
      maxLines: 3,
      textInputAction: TextInputAction.done,
      style: widget.style,
      strutStyle: widget.strutStyle,
      controller: controller,
      onChanged: (String value) =>
          widget.onTextChanged?.call(controller.textWithoutReplacements),
      onSubmitted: (String value) =>
          widget.onSubmitted?.call(controller.textWithoutReplacements),
      decoration: widget.decoration.copyWith(
        filled: true,
        fillColor: Colors.grey.shade200,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w300,
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
    );
  }
}

class ChipsInputEditingController<T> extends TextEditingController {
  ChipsInputEditingController(this.values, this.chipBuilder)
      : super(
          text: String.fromCharCode(kObjectReplacementChar) * values.length,
        );

  static const int kObjectReplacementChar = 0xFFFE;

  List<T> values;
  String previousText = '';

  final Widget Function(BuildContext context, T data) chipBuilder;

  void updateValues(List<T> values) {
    if (values.length != this.values.length) {
      final String char = String.fromCharCode(kObjectReplacementChar);
      final int length = values.length;
      value = TextEditingValue(
        text: char * length,
        selection: TextSelection.collapsed(offset: length),
      );
      this.values = values;
    }
  }

  String get textWithoutReplacements {
    final String char = String.fromCharCode(kObjectReplacementChar);
    return text.replaceAll(RegExp(char), '');
  }

  String get textWithReplacements => text;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final Iterable<WidgetSpan> chipWidgets =
        values.map((T v) => WidgetSpan(child: chipBuilder(context, v)));

    return TextSpan(
      style: style,
      children: <InlineSpan>[
        ...chipWidgets,
        if (textWithoutReplacements.isNotEmpty)
          TextSpan(text: textWithoutReplacements)
      ],
    );
  }
}

class ToppingSuggestion extends StatelessWidget {
  const ToppingSuggestion(this.topping, {Key? key, this.onTap})
      : super(key: key);

  final String topping;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ObjectKey(topping),
      title: Text(topping),
      onTap: () => onTap?.call(topping),
    );
  }
}

class ToppingInputChip extends StatelessWidget {
  const ToppingInputChip({
    Key? key,
    required this.topping,
    required this.onDeleted,
    required this.onSelected,
  }) : super(key: key);

  final String topping;
  final ValueChanged<String> onDeleted;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      child: InputChip(
        key: ObjectKey(topping),
        label: Text(topping),
        onDeleted: () => onDeleted(topping),
        onSelected: (bool value) => onSelected(topping),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(2),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
