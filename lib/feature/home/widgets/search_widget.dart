import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireapps_technical_test/feature/authentication/utils/auth_barrel.dart';
import '../../../utils/config/style_sheet.dart';
import '../../../utils/shared_widgets/assignment_text_box.dart';
import '../../../utils/strings/home_strings.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../utils/home_barrel.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key, this.ignoring=false, this.onTap,this.shouldFocus=false}) : super(key: key);

  final bool ignoring;
  final Function()? onTap;
  final bool shouldFocus;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var _focusNode = FocusNode();
  @override
  void initState() {
    widget.shouldFocus? _focusNode.requestFocus():null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left:StyleSheet.blockSizeHorizontal*2,right: StyleSheet.blockSizeHorizontal*25,top: StyleSheet.blockSizeVertical*1.5,
          bottom: StyleSheet.blockSizeVertical*1.5),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: widget.onTap,
        child: IgnorePointer(
          ignoring: widget.ignoring,
          child: AssignmentTextBox(
            focusNode: _focusNode,
            hintText: HomeStrings.searchProducts,
            suffixIcon: Icon(Icons.search),
            borderOpacity: 0.4,
            borderColor: ColorPallet.kDefaultIconColor.withOpacity(0.3),
            textSize: StyleSheet.smallFontSize+1,
            hintFontSize: StyleSheet.smallFontSize+1,
            onChanged: (searchKeyword){
              context.read<HomeBloc>().add(SearchProducts(searchKeyword.toLowerCase()));
            },
          ),
        ),
      ),
    );
  }
}
