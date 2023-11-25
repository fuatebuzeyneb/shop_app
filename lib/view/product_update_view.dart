import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/widget/custom_buttom_widget.dart';
import 'package:shop_app/widget/custom_textfield_widget.dart';

import '../services/update_product_serviecs.dart';

class ProductUpdateView extends StatefulWidget {
  const ProductUpdateView({super.key});

  static String id = 'ProductUpdateView';

  @override
  State<ProductUpdateView> createState() => _ProductUpdateViewState();
}

class _ProductUpdateViewState extends State<ProductUpdateView> {
  String? productName, description, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Product update',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              CustomTextFieldWidget(
                text: 'Product Name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              CustomTextFieldWidget(
                text: 'Description',
                onChanged: (data) {
                  description = data;
                },
              ),
              CustomTextFieldWidget(
                inpuType: TextInputType.number,
                text: 'Price',
                onChanged: (data) {
                  price = data;
                },
              ),
              CustomTextFieldWidget(
                text: 'Image',
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonWidget(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  await updateProduct(product);
                  try {
                    print('secss');
                  } catch (e) {
                    print('$e');
                  }

                  isLoading = false;
                  setState(() {});
                },
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
