import 'package:emaxapp/common_widgets/creat_app_bar.dart';
import 'package:emaxapp/local_data.dart';
import 'package:emaxapp/providers/storedata.dart';
import 'package:emaxapp/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  static const route = "HistoryScreen";

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  FireStoreDataBase fireStoreDataBase;
  @override
  void initState() {
    super.initState();
    fireStoreDataBase = Provider.of<FireStoreDataBase>(context, listen: false);
    fireStoreDataBase.getDataEG();
    fireStoreDataBase.getDataUS();
    fireStoreDataBase.getDataBE();
  }

  @override
  Widget build(BuildContext context) {
    fireStoreDataBase = Provider.of<FireStoreDataBase>(context, listen: true);
    return Scaffold(
      appBar: CreatAppBar(
        label: 'History',
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(30),
          shrinkWrap: false,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 1),
          itemCount: 3,
          itemBuilder: (context, indexgrid) => buildItems(indexgrid)),
    );
  }

  Widget title(int indexgrid) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      color: color[indexgrid],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          titleEN[indexgrid],
          textAlign: TextAlign.center,
          style: BarStyle.display5(context),
        ),
      ),
    );
  }

  Widget buildItems(int indexgrid) => Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            title(indexgrid),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: indexgrid == 0
                      ? fireStoreDataBase.egypt.length
                      : indexgrid == 1
                          ? fireStoreDataBase.united.length
                          : fireStoreDataBase.belgium.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        indexgrid == 0
                            ? Text(fireStoreDataBase.egypt[index]["number"])
                            : indexgrid == 1
                                ? Text(
                                    fireStoreDataBase.united[index]["number"])
                                : Text(
                                    fireStoreDataBase.belgium[index]["number"]),
                        SizedBox(
                          height: 5,
                        ),
                        indexgrid == 0
                            ? Text(fireStoreDataBase.egypt[index]["contrycode"])
                            : indexgrid == 1
                                ? Text(fireStoreDataBase.united[index]
                                    ["contrycode"])
                                : Text(fireStoreDataBase.belgium[index]
                                    ["contrycode"]),
                        SizedBox(
                          height: 5,
                        ),
                        indexgrid == 0
                            ? Text(
                                fireStoreDataBase.egypt[index]["countryName"])
                            : indexgrid == 1
                                ? Text(fireStoreDataBase.united[index]
                                    ["countryName"])
                                : Text(fireStoreDataBase.belgium[index]
                                    ["countryName"])
                      ],
                    );
                  }),
            ),
          ],
        ),
      );
}
