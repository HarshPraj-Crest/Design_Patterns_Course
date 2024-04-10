
import 'package:strategy_design_pattern/shipping.dart';

abstract class ShippingCalculator {
  double claculateShipping(Order order);
}

class FedexShippingCalculator implements ShippingCalculator {
  @override
  double claculateShipping(Order order) {
    return 9.25;
  }
}

class UpsShippingCalculator implements ShippingCalculator {
  @override
  double claculateShipping(Order order) {
    return 7.25;
  }
}

class PurulatorShippingCalculator implements ShippingCalculator {
  @override
  double claculateShipping(Order order) {
    return 5.00;
  }
}
