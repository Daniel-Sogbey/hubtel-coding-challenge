import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  FocusNode? focusNode;
  TextEditingController? title;
  void Function()? search;

  SearchField({
    Key? key,
    this.focusNode,
    this.title,
    this.search,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, right: 10, top: 10,left: 20),
      width: MediaQuery.of(context).size.width * 0.72,
      height: 60,
      // padding: const EdgeInsets.only(left: 0, right: 0, bottom: 7.5,top: 7.5),

      child: TextField(
        focusNode: focusNode,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w200,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        controller: title,
        cursorColor: Theme.of(context).colorScheme.tertiary,
        decoration: InputDecoration(

          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          // labelText: "Search talent",
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w200,
            color: Colors.black54,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(8),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: "Search",
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w200,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          fillColor: Colors.grey[200],
          filled: true,
        ),
        onSubmitted: (term) => search!(),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}