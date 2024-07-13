import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskroute/presentation/widget/customTextField.dart';
import 'package:taskroute/presentation/widget/grid_view_card_item.dart';
import '../data/dip.dart';
import '../utils/my_colors.dart';
import 'cubit/proudcts_list_cubit.dart';

class ListOfProduct extends StatefulWidget {
  const ListOfProduct({super.key});

  @override
  State<ListOfProduct> createState() => _ListOfProductState();
}

class _ListOfProductState extends State<ListOfProduct> {
  ProductsListCubit modelView = ProductsListCubit(productsRepository: injectProductsRepository());
  @override
  void initState() {
    super.initState();
    modelView.fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.png"),
        leadingWidth: 80,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
              child: CustomTextField(),
            ),
            SizedBox(
              width: 24.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.w),
              child: ImageIcon(
                AssetImage("assets/images/icon _shopping cart_.png"),
                size: 28.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ]),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: BlocBuilder<ProductsListCubit, ProductsListState>(
              bloc:modelView,
              builder: (context, state) {
                if (state is ProductsListLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductsListSuccess) {
                  return GridView.builder(
                    itemCount: state.product.products!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.4,
                      crossAxisSpacing: 9.w,
                      mainAxisSpacing: 15.h,
                    ),
                    itemBuilder: (context, index) {
                      final product = state.product;
                      return InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: GridViewCardItem(product: product,index: index,),
                      );
                    },
                  );
                } else if (state is ProductsListError) {
                  return Center(child: Text(state.message));
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
