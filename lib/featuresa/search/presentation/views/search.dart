import 'package:flutter/material.dart';
import 'package:quotegeneratorapp/featuresa/search/presentation/views/widgets/search_view_body.dart';



// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
      return SearchViewBody();
  }}