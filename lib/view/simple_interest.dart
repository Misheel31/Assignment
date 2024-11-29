import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  final _formKey = GlobalKey<FormState>();
  final principalController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();
  double interest = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Interest"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Principal",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the principal amount";
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return "Enter a valid positive number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Rate of Interest (%)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the rate of interest";
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return "Enter a valid positive number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Time (in years)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the time period";
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return "Enter a valid positive number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      double principal =
                          double.tryParse(principalController.text) ?? 0.0;
                      double rate = double.tryParse(rateController.text) ?? 0.0;
                      double time = double.tryParse(timeController.text) ?? 0.0;
                      interest = (principal * rate * time) / 100; // Formula: PRT/100
                    });
                  }
                },
                child: const Text("Calculate Interest"),
              ),
              const SizedBox(height: 16),
              Text(
                "Simple Interest: $interest",
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
