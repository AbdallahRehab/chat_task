import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:full_chat_application/core/utils/navigation.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/global/global_widget/global_widget.dart';
import '../../domain/entities/home/products.dart';
import '../controllers/home_cubit/home_cubit.dart';
import 'details_screen.dart';

// class SearchScreen extends StatelessWidget {
//   var searchController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SearchCubit, SearchState>(
//       listener: (context, state) {
//         if (state is SearchSuccessState) {
//           if (state.model.status && state.model.data.isEmpty) {
//             buildShowToast(
//               message: 'Not Found!',
//               state: ToastState.warning,
//             );
//           }
//         }
//       },
//       builder: (context, state) {
//         return KeyboardDismisser(
//           gestures: const [
//             GestureType.onTap,
//             GestureType.onPanUpdateDownDirection
//           ],
//           child: Scaffold(
//             appBar: AppBar(),
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: formKey,
//                 child: CustomScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   slivers: [
//                     SliverToBoxAdapter(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: buildTypeAheadField(context),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

TypeAheadField<Products?> buildTypeAheadField(BuildContext context) {
  // HomeCubit cubit=HomeCubit.get(context);
  return TypeAheadField<Products?>(
    debounceDuration: const Duration(microseconds: 500),
    hideOnEmpty: true,
    textFieldConfiguration: const TextFieldConfiguration(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(IconlyBroken.search),
        hintText: 'Search',
        label: Text(
          'Search',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    ),
    suggestionsCallback: (pattern) async{
      return await HomeCubit.get(context).getUserSuggestion(pattern);
    },
    itemBuilder: (context, suggestion) {
      return buildSearchItem(model: suggestion!, context: context);
    },

    onSuggestionSelected: (suggestion) {
      navigateTo(context, DetailsScreen(model: suggestion!,),);
    },
    noItemsFoundBuilder: (context) {
      return  SizedBox(
        height: 50.0,
        child:  Center(
          child: Text('No Items Found!',style: Theme.of(context).textTheme.bodyText1,),
        ),
      );
    },
  );
}

Widget buildSearchItem({
  required Products model,
  required BuildContext context,
}) {
  // log('search name: ${model.name}');
  // log('search old price: ${model.oldPrice}');
  // log('search discount: ${model.discount}');
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    child: Card(
      color: Colors.grey.shade50,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Card(
              elevation: 7.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: buildCachedNetworkImage(
                  imageUrl: model.image,
                  width: 90,
                  height: 110,
                  // fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              width: 7.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.0,
                      height: 1.4,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Arial',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${model.price.round()}',
                        style: const TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w900,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      if (model.price < model.oldPrice)
                        Text(
                          '\$${model.oldPrice.round()!}',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                              fontWeight: FontWeight.w900,
                              decoration:
                              TextDecoration.lineThrough,
                              color: Colors.black26),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),

    // child: Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(
    //       7.0,
    //     ),
    //     border: Border.all(
    //       color: Colors.black26,
    //       width: 1.0,
    //     ),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(15.0),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         buildCachedNetworkImage(
    //           imageUrl: model.image,
    //           width: 150.0,
    //           height: 120.0,
    //         ),
    //         const SizedBox(
    //           width: 5.0,
    //         ),
    //         Expanded(
    //           child: SizedBox(
    //             height: 110,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   model.name!,
    //                   maxLines: 2,
    //                   style: Theme.of(context).textTheme.subtitle1!.copyWith(
    //                         overflow: TextOverflow.ellipsis,
    //                         height: 1.4,
    //                       ),
    //                 ),
    //                 const SizedBox(
    //                   height: 10.0,
    //                 ),
    //                 Row(
    //                   children: [
    //                     Text(
    //                       '${model.price.round()}',
    //                       style: const TextStyle(
    //                         color: Colors.blue,
    //                         fontSize: 15.0,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       width: 10.0,
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
  );
}

// child: buildTextFormField(
//   controller: searchController,
//   label: 'Search',
//   type: TextInputType.text,
//   prefix: const Icon(
//     IconlyBroken.search,
//   ),
//   validator: (value){
//     if(value!.isEmpty){
//       return 'Please enter value.';
//     }
//     return null;
//   },
//   onSubmit: (value) {
//     if(formKey.currentState!.validate()){
//       SearchCubit.get(context)
//           .search(text: value);
//     }
//   },
// ),

// if (state is SearchLoadingState)
//   const SliverToBoxAdapter(
//       child: LinearProgressIndicator()),
// if (SearchCubit.get(context).searchModel == null)
//   SliverToBoxAdapter(
//     child: Center(
//       child: Image.asset('assets/images/no data.png'),
//     ),
//   ),
// if (state is SearchSuccessState)
//   SliverList(
//     delegate: SliverChildBuilderDelegate(
//       (context, index) {
//         return buildSearchItem(
//           model: (SearchCubit.get(context)
//               .searchModel
//               ?.data[index])!,
//           context: context,
//         );
//       },
//       childCount:
//           SearchCubit.get(context).searchModel?.data.length,
//     ),
//   ),
