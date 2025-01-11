import 'package:flutter/material.dart';
import 'package:meditator_app/models/function_data_model.dart';

class FunctionPage extends StatefulWidget {
  FunctionData functionData;
  FunctionPage({
    super.key,
    required this.functionData,
  });

  @override
  State<FunctionPage> createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Function"),
      ),
    );
  }
}
