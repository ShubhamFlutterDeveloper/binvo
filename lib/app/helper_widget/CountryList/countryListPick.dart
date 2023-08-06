import 'package:binvo/app/string/hexcolor.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/selection_list.dart';
import 'package:country_list_pick/support/code_countries_en.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:country_list_pick/support/code_countrys.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CountryListPick extends StatefulWidget {
  CountryListPick(
      {this.onChanged,
        this.initialSelection,
        this.appBar,
        this.pickerBuilder,
        this.countryBuilder,
        this.theme,
        this.useUiOverlay = true,
        this.useSafeArea = false});

  final String? initialSelection;
  final ValueChanged<CountryCode?>? onChanged;
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, CountryCode? countryCode)?
  pickerBuilder;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, CountryCode countryCode)?
  countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  @override
  _CountryListPickState createState() {
    List<Map> jsonList =
    this.theme?.showEnglishName ?? true ? countriesEnglish : codes;

    List elements = jsonList
        .map((s) => CountryCode(
      name: s['name'],
      code: s['code'],
      dialCode: s['dial_code'],
      flagUri: 'flags/${s['code'].toLowerCase()}.png',
    ))
        .toList();
    return _CountryListPickState(elements);
  }
}

class _CountryListPickState extends State<CountryListPick> {
  CountryCode? selectedItem;
  List elements = [];

  _CountryListPickState(this.elements);

  @override
  void initState() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
              (e) =>
          (e.code.toUpperCase() ==
              widget.initialSelection!.toUpperCase()) ||
              (e.dialCode == widget.initialSelection),
          orElse: () => elements[0] as CountryCode);
    } else {
      selectedItem = elements[0];
    }

    super.initState();
  }
  void _openCountryPickerModal(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(2.h), topLeft: Radius.circular(2.h))),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState) =>
                  DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.94,
                    builder: (context, myScrollController) {
                      return SelectionList(
                        elements,
                        selectedItem,
                        appBar: widget.appBar ??
                            AppBar(
                              backgroundColor:
                              Theme
                                  .of(context)
                                  .appBarTheme
                                  .backgroundColor,
                              title: Text("Select Country"),
                            ),
                        theme: widget.theme,
                        countryBuilder: widget.countryBuilder,
                        useUiOverlay: widget.useUiOverlay,
                        useSafeArea: widget.useSafeArea,
                      );
                    },
                  )
          );
        }).then((result) {
      if (result != null) {
        setState(() {
          selectedItem = result;
          widget.onChanged!(result);
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _openCountryPickerModal(context);
      },
      child: widget.pickerBuilder != null
          ? widget.pickerBuilder!(context, selectedItem)
          : Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.theme?.isShowFlag ?? true == true)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(
                  selectedItem!.flagUri!,
                  package: 'country_list_pick',
                  width: 32.0,
                ),
              ),
            ),
          if (widget.theme?.isShowCode ?? true == true)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(selectedItem.toString(), style: TextStyle(color: HexColor("#282A38"),fontSize: 11.sp,fontWeight: FontWeight.w600),),
              ),
            ),
          if (widget.theme?.isShowTitle ?? true == true)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(selectedItem!.toCountryStringOnly()),
              ),
            ),
          if (widget.theme?.isDownIcon ?? true == true)
            Flexible(
              child: Icon(Icons.keyboard_arrow_down,color: HexColor("#282A38"),),
            )
        ],
      ),
    );
  }
}
