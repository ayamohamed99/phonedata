// import 'package:emaxapp/common_widgets/creat_app_bar.dart';
// import 'package:emaxapp/common_widgets/creat_text_field.dart';
// import 'package:emaxapp/local_data.dart';
// import 'package:emaxapp/providers/todo_provider.dart';
// import 'package:emaxapp/utilities/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class ListViewScreen extends StatefulWidget {
//   static const route = "ListViewScreen";

//   const ListViewScreen({Key key}) : super(key: key);
//   @override
//   _ListViewScreenState createState() => _ListViewScreenState();
// }

// class _ListViewScreenState extends State<ListViewScreen> {
//   ToDoProvider toDoProvider;

//   @override
//   void initState() {
//     super.initState();
//     toDoProvider = Provider.of<ToDoProvider>(context, listen: false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     toDoProvider = Provider.of<ToDoProvider>(context, listen: true);
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: CreatAppBar(
//           label: "MY-TO-DO-List",
//         ),
//         body: Stack(
//           children: [
//             GridView.builder(
//                 padding: EdgeInsets.all(30),
//                 shrinkWrap: false,
//                 physics: NeverScrollableScrollPhysics(),
//                 reverse: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 2.0,
//                     crossAxisSpacing: 2.0,
//                     childAspectRatio: 0.8),
//                 itemCount: 3,
//                 itemBuilder: (context, indexgrid) => _body(indexgrid)),
//           ],
//         ));
//   }

//   Widget _body(int indexgrid) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//         padding: EdgeInsets.all(10),
//         margin: EdgeInsets.all(10.0),
//         color: color[indexgrid],
//         height: size.height,
//         child: _part1(indexgrid));
//   }

//   Widget _listViewBody(int index, int indexgrid, var day, var week, var month) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.all(3.0),
//       width: size.width,
//       child: Row(children: [
//         IconButton(
//             onPressed: () {
//               switch (indexgrid) {
//                 case 0:
//                   setState(() {
//                     day[index].check = !day[index].check;
//                   });

//                   break;
//                 case 1:
//                   setState(() {
//                     week[index].check = !week[index].check;
//                   });

//                   break;
//                 case 2:
//                   setState(() {
//                     month[index].check = !month[index].check;
//                   });
//                   break;
//               }
//             },
//             icon: (indexgrid == 0 && day[index].check == true)
//                 ? Icon(FontAwesomeIcons.checkCircle)
//                 : (indexgrid == 1 && week[index].check == true)
//                     ? Icon(FontAwesomeIcons.checkCircle)
//                     : (indexgrid == 2 && month[index].check == true)
//                         ? Icon(FontAwesomeIcons.checkCircle)
//                         : Icon(FontAwesomeIcons.circle)),
//         SizedBox(width: 5),
//         Expanded(
//           child: Text(
//             indexgrid == 0
//                 ? day[index].taskbody
//                 : indexgrid == 1
//                     ? week[index].taskbody
//                     : month[index].taskbody,
//             maxLines: 40,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 18,
//               decoration: (indexgrid == 0 && day[index].check == true)
//                   ? TextDecoration.lineThrough
//                   : (indexgrid == 1 && week[index].check == true)
//                       ? TextDecoration.lineThrough
//                       : (indexgrid == 2 && month[index].check == true)
//                           ? TextDecoration.lineThrough
//                           : TextDecoration.none,
//               // color: index.isEven ? Colors.blue : Colors.white
//             ),
//           ),
//         ),
//         IconButton(
//             onPressed: () {
//               setState(() {
//                 indexgrid == 0
//                     ? day.removeAt(index)
//                     : indexgrid == 1
//                         ? week.removeAt(index)
//                         : month.removeAt(index);
//               });
//             },
//             icon: Icon(
//               FontAwesomeIcons.trash,
//               color: titleColor[indexgrid],
//             ))
//       ]),
//     );
//   }

//   Widget _part1(int indexgrid) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           height: size.height * 0.1,
//           color: titleColor[indexgrid],
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage(images[indexgrid]),
//                 ),
//               ),
//               Text(
//                 titleEN[indexgrid],
//                 style: Maintext.display5(context),
//               ),
//             ],
//           ),
//         ),
//         _part2(indexgrid),
//         _part3(indexgrid)
//       ],
//     );
//   }

//   Widget _part2(int indexgrid) {
//     var day = toDoProvider.allTasks1;
//     var week = toDoProvider.allTasks2;
//     var month = toDoProvider.allTasks3;
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Container(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: indexgrid == 0
//                     ? day.length
//                     : indexgrid == 1
//                         ? week.length
//                         : month.length,
//                 itemBuilder: (context, index) =>
//                     _listViewBody(index, indexgrid, day, week, month))),
//       ),
//     );
//   }

//   Widget _part3(int indexgrid) {
//     final AlertDialog alert = AlertDialog(
//         title: Text('Please enter a new task'),
//         content: TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text("Okay"),
//         ));
//     return Row(
//       children: [
//         Expanded(
//             flex: 3,
//             child: CreatTextField(
//               controller: indexgrid == 0
//                   ? bodycontrallerD
//                   : indexgrid == 1
//                       ? bodycontrallerW
//                       : bodycontrallerM,
//             )),
//         Expanded(
//           flex: 1,
//           child: Container(
//               height: 75,
//               child: IconButton(
//                   onPressed: () {
//                     if (bodycontrallerD.text.isEmpty &&
//                         bodycontrallerM.text.isEmpty &&
//                         bodycontrallerW.text.isEmpty) {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return alert;
//                         },
//                       );
//                     } else {
//                       toDoProvider.addTask(
//                           to_do_list: indexgrid,
//                           body: indexgrid == 0
//                               ? bodycontrallerD.text
//                               : indexgrid == 1
//                                   ? bodycontrallerW.text
//                                   : bodycontrallerM.text);
//                       indexgrid == 0
//                           ? bodycontrallerD.clear()
//                           : indexgrid == 1
//                               ? bodycontrallerW.clear()
//                               : bodycontrallerM.clear();
//                     }
//                   },
//                   icon: Icon(
//                     FontAwesomeIcons.plusCircle,
//                     size: 40,
//                     color: Colors.white,
//                   ))),
//         )
//       ],
//     );
//   }
// }
