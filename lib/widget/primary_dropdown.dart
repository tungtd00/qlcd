import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:qlcd/widget/primary_card.dart';

import '../constant/constants.dart';
import '../generated/l10n.dart';

var data = [
  'Lựa chọn 1',
  'Lựa chọn 2',
  'Lựa chọn 3',
  'Lựa chọn 4',
  'Lựa chọn 5',
  'Lựa chọn 6',
  'Lựa chọn 7',
  'Lựa chọn 8',
  'Lựa chọn 9',
  'Lựa chọn 10',
  'Lựa chọn 11',
  'Lựa chọn 12',
  'Lựa chọn 13',
  'Lựa chọn 14'
];

var items = data.asMap().entries.map((v) {
  return DropdownMenuItem(
    value: v.key,
    child: Text(v.value),
  );
}).toList();

class PrimaryDropDown extends StatefulWidget {
  PrimaryDropDown({
    super.key,
    this.label,
    this.isRequired = false,
    this.value,
    this.onChange,
    this.selectList,
    this.isMultiple = false,
    this.selectMultileList,
    this.validateString,
    this.validator,
  });

  final String? label;
  final bool isRequired;
  final bool isMultiple;
  String? value;
  Function(dynamic)? onChange;
  String? Function(dynamic)? validator;
  final List<DropdownMenuItem>? selectList;
  final List<String>? selectMultileList;
  String? validateString;

  @override
  State<PrimaryDropDown> createState() => _PrimaryDropDownState();
}

class _PrimaryDropDownState extends State<PrimaryDropDown> {
  int indexSelected = 1;
  List<String> selectedList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label!,
              style: txtBodySmallRegular(color: grayScaleColorBase),
            ),
            if (widget.isRequired) hpad(4),
            if (widget.isRequired)
              Text("*", style: txtBodySmallRegular(color: redColorBase))
          ],
        ),
        if (widget.label != null) vpad(8),
        widget.isMultiple
            ? MultiSelectDialogField(
                title: Text(S.of(context).select),
                selectedColor: secondaryColorBase,
                buttonText: Text(
                  "--${S.of(context).select}--",
                  overflow: TextOverflow.ellipsis,
                ),
                buttonIcon: const Icon(Icons.arrow_drop_down),
                searchHint: '--${S.of(context).select}--',
                onConfirm: (v) {
                  selectedList = v;
                },
                items: widget.selectMultileList != null
                    ? widget.selectMultileList!
                        .map((e) => MultiSelectItem(e, e))
                        .toList()
                    : data.map((e) => MultiSelectItem(e, e)).toList(),
                decoration: BoxDecoration(
                  // border: Border.all(color: BorderSide.none),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              )
            : PrimaryCard(
                child: DropdownButtonFormField<dynamic>(
                  validator: widget.validator,
                  dropdownColor: Colors.white,
                  value: widget.value,
                  isExpanded: true,
                  // value: items[indexSelected],
                  // dropdownColor: Colors.black,
                  hint: Text(
                    "--${S.of(context).select}--",
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: txtBodySmallBold(color: grayScaleColorBase),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: txtBodySmallBold(color: grayScaleColor3),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: primaryColor2, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: redColor2, width: 2)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: widget.onChange ??
                      (v) {
                        if (widget.value != null) {
                          widget.value = v.toString();
                        }
                      },
                  items: widget.selectList ?? items,
                ),
              ),
        if (widget.validateString != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 4),
            child: Text(
              widget.validateString!,
              style: txtRegular(13, redColorBase),
            ),
          )
      ],
    );
  }
}
