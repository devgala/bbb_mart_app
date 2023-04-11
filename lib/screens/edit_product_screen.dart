import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProductScreen extends StatefulWidget {
  @override
  static const routeName = '/editProduct';
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final imageUrlFocusNode = FocusNode();
  @override
  void initState() {
    imageUrlFocusNode.addListener(changeFocus);
    super.initState();
  }
  @override
  void dispose() {
    imageUrlFocusNode.removeListener(changeFocus);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    imageUrlFocusNode.dispose();
    super.dispose();
  }
  void changeFocus(){
    if(!imageUrlFocusNode.hasFocus){
      setState(() {}); // just rebuilds page and thus updates image with current urls
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Placeholder')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  label: const Text('Title'),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      width: 0.4,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      width: 0.4,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(
                      _priceFocusNode); // focus to the input connected to _priceFocusNode
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                decoration: InputDecoration(
                  label: const Text('Price'),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      width: 0.4,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      width: 0.4,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  label: const Text('Decription'),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      width: 0.4,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      width: 0.4,
                    ),
                  ),
                ),
                maxLines: 3,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.7),
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    child: _imageUrlController.text.isNotEmpty
                        ? FittedBox(
                            child: Image.network(_imageUrlController.text))
                        : Center(child: Text('Enter URL')),
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                      label: const Text('Image URL'),
                    ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,

                  )),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
