import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dropdown(),
    );
  }
}

class Dropdown extends StatelessWidget {
  List<Map<String, dynamic>> dataList = [
    {
      "country": "France",
      "id": 1,
    },
    {
      "country": "Germany",
      "id": 2,
    },
    {
      "country": "Indonesia",
      "id": 3,
    },
    {
      "country": "Russia",
      "id": 4,
    },
    {
      "country": "England",
      "id": 5,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown Search")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownSearch<Map<String, dynamic>>(
          // items: ["Indonesia", "Inggris", "Perancis"],
          items: dataList,
          onChanged: (value) => print(value?["id"] ?? null),
          selectedItem: {
            "country": "Indonesia",
            "id": "3",
          },
          clearButtonProps: ClearButtonProps(
            isVisible: true,
          ),
          popupProps: PopupProps.menu(
              showSearchBox: true,
              // showSelectedItems: true,
              // disabledItemFn: (String s) => s.startsWith("I"),
              itemBuilder: (context, item, isSelected) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(item["country"]),
                );

                //Text(item.),
                // print(item),
                // return Text("coba");
              }),
          // dropdownBuilder: _customDropDownExampleMultiSelection,
          dropdownBuilder: (context, selectedItem) =>
              Text(selectedItem?["country"].toString() ?? "belum pilih data"),
        ),
      ),
    );
  }

  Widget _customDropDownExampleMultiSelection(BuildContext context, dataList) {
    if (dataList.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      );
    }

    return Wrap(
      children: dataList.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                  // this does not work - throws 404 error
                  // backgroundImage: NetworkImage(item.avatar ?? ''),
                  ),
              title: Text(e?["id"] ?? ''),
              subtitle: Text(
                e?["country"].toString() ?? '',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
