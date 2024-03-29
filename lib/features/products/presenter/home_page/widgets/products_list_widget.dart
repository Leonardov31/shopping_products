import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_products/core/helpers/price_format.dart';
import 'package:shopping_products/features/products/domain/entities/product_entity.dart';
import 'package:shopping_products/features/products/presenter/home_page/widgets/delete_product_dialog.dart';
import 'package:shopping_products/features/products/presenter/home_page/widgets/edit_product_dialog_form.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({
    Key? key,
    required this.products,
    this.isTest = false,
  }) : super(key: key);

  final List<ProductEntity>? products;
  final bool isTest;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products?.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                child: Row(
                  children: [
                    if (isTest == false)
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image(
                          fit: BoxFit.fitWidth,
                          width: 100,
                          frameBuilder: (BuildContext context, Widget child,
                              int? frame, bool wasSynchronouslyLoaded) {
                            if (wasSynchronouslyLoaded) {
                              return child;
                            }
                            return AnimatedOpacity(
                              opacity: frame == null ? 0 : 1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeOut,
                              child: child,
                            );
                          },
                          errorBuilder: (context, _, __) {
                            return Image.asset('assets/placeholder.png');
                          },
                          image: FirebaseImage(
                            products![index].photoUrl,
                            shouldCache: true,
                          ),
                        ),
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${products?[index].title}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Text(
                              '${products?[index].type}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBarIndicator(
                                rating: products?[index].rating.toDouble()
                                    as double,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 16.0,
                              ),
                              Text(
                                'R\$ ${PriceFormat.formatToString(products?[index].price ?? 0)}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).cardColor,
                child: PopupMenuButton(
                  icon: const Icon(Icons.more_horiz),
                  onSelected: (value) {
                    switch (value) {
                      case 0:
                        editProductForm(context, products![index]);
                        break;
                      case 1:
                        deleteProductDialog(context, products![index]);
                        break;
                      default:
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text('Editar'),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Deletar'),
                      ),
                    ];
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
