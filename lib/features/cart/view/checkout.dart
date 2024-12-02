import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/routes/route_provider.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/cart/controller/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.checkout),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: context.tr.enterYourAddress,
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                context.pushNamed(NameRoutes.locationNameRoute);
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.location_on,
                  size: 32.0,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Consumer(builder: (context, ref, child) {
              final cartProviderState = ref.watch(cartProvider);
              //
              return Text(
                '${context.tr.total} : ${cartProviderState.total.round()}\$',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              );
            }),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
