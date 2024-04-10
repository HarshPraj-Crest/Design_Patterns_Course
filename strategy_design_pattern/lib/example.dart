import 'package:flutter/material.dart';
import 'package:strategy_design_pattern/shipping.dart';
import 'package:strategy_design_pattern/shipping_renderer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Order order = Order(
      ShippingOptions.ups,
      Address(), //Initialize with empty Address
      objects(),
      Address());
  ShippingCalculator? shippingCalculator;
  ShippingOptions selectedOption = ShippingOptions.fedex; // Initial selection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategy Design Pattern'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            const Text(
              "Choose your shipping  ",
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            RadioListTile<ShippingOptions>(
              title: const Text("fedex shipping "),
              value: ShippingOptions.fedex,
              groupValue: selectedOption,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                  shippingCalculator = FedexShippingCalculator();
                  shippingCalculator!
                      .claculateShipping(order); // Calculate cost on change
                });
              },
            ),
            RadioListTile<ShippingOptions>(
              title: const Text("Ups shipping "),
              value: ShippingOptions.ups,
              groupValue: selectedOption,
              activeColor: Colors.blue, // Color for selected option
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                  shippingCalculator = UpsShippingCalculator();
                  shippingCalculator!.claculateShipping(order);
                });
              },
            ),
            RadioListTile<ShippingOptions>(
              title: const Text("Purulator shipping "),
              value: ShippingOptions.purulator,
              groupValue: selectedOption,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                  shippingCalculator = PurulatorShippingCalculator();
                  shippingCalculator!
                      .claculateShipping(order); // Calculate cost on change
                });
              },
            ),
            const Divider(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                shippingCalculator != null
                    ? '${shippingCalculator!.claculateShipping(order)}\$'
                    : 'Please choose a shipping option.',
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
