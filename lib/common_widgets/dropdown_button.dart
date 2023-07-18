import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final String hint;
  final List<String> items;

  const MyDropdownButton({
    Key? key,
    required this.hint,
    required this.items,
  }) : super(key: key);

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String? selectedState; // Declare the selectedState variable as nullable

  @override
  void initState() {
    super.initState();
    selectedState = widget.items[0]; // Initialize the selectedState with the first item
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: TColor.textbox),
      child: DropdownButton(
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        hint: Text(widget.hint),
        underline: Container(),
        value: selectedState,
        items: widget.items.map((name) {
          return DropdownMenuItem(
            value: name,
            child: Text(name),
          );
        }).toList(),
        onChanged: (selectVal) {
          setState(() {
            selectedState = selectVal; // Update the selectedState variable
          });
        },
      ),
    );
  }
}
