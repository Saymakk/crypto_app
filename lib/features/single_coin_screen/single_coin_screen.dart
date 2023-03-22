import 'package:flutter/material.dart';

class SingleCoinScreen extends StatefulWidget {
  const SingleCoinScreen({Key? key}) : super(key: key);

  @override
  State<SingleCoinScreen> createState() => _SingleCoinScreenState();
}

class _SingleCoinScreenState extends State<SingleCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    // assert(args != null && args is String, 'Must be string');
    if (args == null) {
      print('must provide args');
      return;
    }
    if (args is! String) {
      print('must be string');
      return;
    }
    setState(() {
      coinName = args as String;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${coinName ?? '...'}'),
      ),
    );
  }
}
