import 'package:flutter/material.dart';
import 'package:flutter_application_2/produt_api_screen/data_source/product_api_data_source_impl.dart';

class ProudctApiScreen extends StatefulWidget {
  const ProudctApiScreen({super.key});

  @override
  State<ProudctApiScreen> createState() => _ProudctApiScreenState();
}

class _ProudctApiScreenState extends State<ProudctApiScreen> {
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchproduct();
  }

  Future<void> fetchproduct() async {
    setState(() {
      isLoading = true;
    });

    await ProductApiDataSourceImpl.getproduct();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ProductApiDataSourceImpl.products.length == 0
            ? Text('dont have proudct')
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      ProductApiDataSourceImpl.products[index].image,
                    ),
                    title: Text(ProductApiDataSourceImpl.products[index].title),
                    subtitle: Text(
                      ProductApiDataSourceImpl.products[index].description,
                      maxLines: 1,
                    ),
                    trailing: Text(
                      '${ProductApiDataSourceImpl.products[index].price}\$',
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: ProductApiDataSourceImpl.products.length,
              ),
      ),
    );
  }
}
