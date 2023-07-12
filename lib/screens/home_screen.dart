import 'package:flutter/material.dart';
import 'package:hubtel_code_challenge/widgets/loading_spinner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _loading = false;

  @override
  void didChangeDependencies() {
    setState(() {
      _loading = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: LoadingSpinner(),
            )
          : const Center(
              child: Text("Done"),
            ),
    );
  }
}
