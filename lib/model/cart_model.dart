class CartModel {
  final List<List<String>> _shopItems = [
    ["Air Conditioner", "162.75", "lib/images/ac.jpg"],
    ["Blender", "16.275", "lib/images/blender.jpg"],
    ["Standing fan", "52.08", "lib/images/fan.jpg"],
    ["HeadPhones", "9.765", "lib/images/headphone.jpg"],
    ["Trouser", "3.255", "lib/images/jacket.jpg"],
    ["Samsung S24 Ultra", "1009.05", "lib/images/phone.jpg"],
    ["Microwave", "162.75", "lib/images/microwave.jpg"],
    ["Washing Machine", "162.75", "lib/images/washing_machine.jpg"],
  ];

  List<List<String>> _cartItems = [];

  List<List<String>> get shopItems => _shopItems;
  List<List<String>> get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
  }

  void removeItemFromCart(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
    }
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += double.parse(item[1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
