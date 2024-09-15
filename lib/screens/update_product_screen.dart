import 'package:flutter/material.dart';

class UpdateproductScreen extends StatefulWidget {
  const UpdateproductScreen({super.key});

  @override
  State<UpdateproductScreen> createState() => _UpdateproductScreenState();
}

class _UpdateproductScreenState extends State<UpdateproductScreen> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _productImageTEController =
  TextEditingController();
  final TextEditingController _productCodeTEController =
  TextEditingController();
  final TextEditingController _productQuantityTEController =
  TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildNewProductForm(),
      ),
    );
  }

  Widget _buildNewProductForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: const InputDecoration(
                hintText: 'Name', labelText: 'Product Name'),
          ),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Unit Price', labelText: 'Unit Price'),
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Total Price', labelText: 'Total Price'),
          ),
          TextFormField(
            controller: _productImageTEController,
            decoration: const InputDecoration(
                hintText: 'Image', labelText: 'Product Image'),
          ),
          TextFormField(
            controller: _productCodeTEController,
            decoration: const InputDecoration(
                hintText: 'Product Code', labelText: 'Product Code'),
          ),
          TextFormField(
            controller: _productQuantityTEController,
            decoration: const InputDecoration(
                hintText: 'Quantity', labelText: 'Quantity'),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(double.maxFinite)),
            onPressed: _onTapProductButton,
            child: const Text("Update"),
          )
        ],
      ),
    );
  }

  void _onTapProductButton() {}

  @override
  void dispose() {
    _productQuantityTEController.dispose();
    _productCodeTEController.dispose();
    _productImageTEController.dispose();
    _totalPriceTEController.dispose();
    _productNameTEController.dispose();

    super.dispose();
  }
}
