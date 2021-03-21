import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit_product_screen';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  var _priceFocuseNode = FocusNode();
  var _descriptionFocuseNode = FocusNode();
  var _imageUrlFocuseNode = FocusNode();
  var _imageUrlController = TextEditingController();
  var _titleController = TextEditingController();
  var _priceController = TextEditingController();
  var _descriptionController = TextEditingController();

  @override
  void dispose() {
    _priceFocuseNode.dispose();
    _descriptionFocuseNode.dispose();
    _imageUrlFocuseNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit the product')),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocuseNode);
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocuseNode,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocuseNode,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('enter an Image Url')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image Url'),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: _imageUrlController,
                      onEditingComplete: () {
                        setState(() {
                          Provider.of<Products>(context, listen: false)
                              .addProduct(Product(
                                  id: DateTime.now().toString(),
                                  title: _titleController.text,
                                  description: _descriptionController.text,
                                  price: double.parse(_priceController.text),
                                  imageUrl: _imageUrlController.text));
                        });
                      },
                      focusNode: _imageUrlFocuseNode,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
