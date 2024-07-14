
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskroute/data/model/Data.dart';
import 'package:taskroute/presentation/cubit/proudcts_list_cubit.dart';
import '../../utils/my_colors.dart';

class GridViewCardItem extends StatelessWidget {
  final Products product;
  final bool isWishlisted;

  GridViewCardItem({
    required this.product,
    this.isWishlisted = false,
  });

  @override
  Widget build(BuildContext context) {
    String imageUrl = product.images!.isNotEmpty ? product.images![0] : '';
    print(imageUrl);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 191.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  width: 195.w,
                  height: 125.h,
                ),
              ),
              Positioned(
                top: 6.h,
                right: 7.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15.r,
                  child: IconButton(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: isWishlisted
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(
                      Icons.favorite_border_rounded,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              product.title??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              product.description??"",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  "EGP ${product.price}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 35.w,
                ),
                Text(
                  " ${product.discountPercentage}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              children: [
                Text(
                  "Reviews (${product.rating})",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Image.asset(
                  "assets/images/emoji _white medium star_.png",
                ),
                const Spacer(
                  flex: 1,
                ),
                Icon(
                  Icons.add_circle,
                  size: 32.sp,
                  color: AppColors.primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
