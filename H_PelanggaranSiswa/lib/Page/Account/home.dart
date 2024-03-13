///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class home extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffe3e3e3),
appBar: 
AppBar(
elevation:0,
centerTitle:true,
automaticallyImplyLeading: false,
backgroundColor:Color(0xfff4f2f2),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
leading: Icon(
Icons.menu,
color:Color(0xff000000),
size:24,
),
),
body:
ListView(
scrollDirection: Axis.vertical,
padding:EdgeInsets.all(16),
shrinkWrap:false,
physics:ScrollPhysics(), 
children:[

Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 16),
child:
Stack(
alignment:Alignment.centerLeft,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.fromLTRB(60, 0, 0, 0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:130,
decoration: BoxDecoration(
color:Color(0xffe6e5e5),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(12.0),
border:Border.all(color:Color(0xff8a8a8a),width:1),
),
child:
Padding(
padding:EdgeInsets.fromLTRB(60, 0, 10, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.min,
children: [
Text(
"0",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:30,
color:Color(0xff3b3b3b),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 8, 0, 12),
child:Text(
"Surat Peringatan 1",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff404040),
),
),
),
MaterialButton(
onPressed:(){},
color:Color(0xffff8d00),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(5.0),
),
padding:EdgeInsets.all(0),
child:Text("Sp 1 perlu dicetak", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:40,
minWidth:140,
),
],),),
),
Icon(
Icons.notifications,
color:Color(0xffb6b6b6),
size:120,
),
],),),
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 16),
child:
Stack(
alignment:Alignment.centerLeft,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.fromLTRB(60, 0, 0, 0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:130,
decoration: BoxDecoration(
color:Color(0xffebebeb),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(12.0),
border:Border.all(color:Color(0xff757575),width:1),
),
child:
Padding(
padding:EdgeInsets.fromLTRB(60, 0, 10, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.min,
children: [
Text(
"0",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:30,
color:Color(0xff333333),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 8, 0, 12),
child:Text(
"Surat Peringatan 2",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff404040),
),
),
),
MaterialButton(
onPressed:(){},
color:Color(0xffff8d00),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(5.0),
),
padding:EdgeInsets.all(0),
child:Text("Sp 2 perlu dicetak", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:40,
minWidth:140,
),
],),),
),
Icon(
Icons.notifications,
color:Color(0xffff6b00),
size:120,
),
],),),
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 16),
child:
Stack(
alignment:Alignment.centerLeft,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.fromLTRB(60, 0, 0, 0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:130,
decoration: BoxDecoration(
color:Color(0xffe6e5e5),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(12.0),
border:Border.all(color:Color(0xff888888),width:1),
),
child:
Padding(
padding:EdgeInsets.fromLTRB(60, 0, 10, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.min,
children: [
Text(
"0",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:30,
color:Color(0xff323232),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 8, 0, 12),
child:Text(
"Surat Peringatan 3",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff3d3d3d),
),
),
),
MaterialButton(
onPressed:(){},
color:Color(0xffff8d00),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(5.0),
),
padding:EdgeInsets.all(0),
child:Text("Sp 3 Perlu di cetak", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:40,
minWidth:140,
),
],),),
),
Icon(
Icons.notifications,
color:Color(0xffb31c1c),
size:120,
),
],),),
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 16),
child:
Stack(
alignment:Alignment.centerLeft,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.fromLTRB(60, 0, 0, 0),
padding:EdgeInsets.all(0),
width:200,
height:130,
decoration: BoxDecoration(
color:Color(0xffe3e2e2),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(12.0),
border:Border.all(color:Color(0xff9e9e9e),width:1),
),
child:
Padding(
padding:EdgeInsets.fromLTRB(60, 0, 10, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.min,
children: [
Text(
"0",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:30,
color:Color(0xff000000),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 8, 0, 12),
child:Text(
"Keputusan Akhir",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
MaterialButton(
onPressed:(){},
color:Color(0xffff7400),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(5.0),
),
padding:EdgeInsets.all(0),
child:Text("Perlu Dirapatkan", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:40,
minWidth:140,
),
],),),
),
Icon(
Icons.info_outline,
color:Color(0xffc90000),
size:120,
),
],),),
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 16),
child:
Stack(
alignment:Alignment.centerLeft,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:130,
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(12.0),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.min,
children: [
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 10),
child:Text(
"TA 2024/2025",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:30,
color:Color(0xff6b6b6b),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(40, 0, 0, 0),
child:MaterialButton(
onPressed:(){},
color:Color(0xff262693),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(8.0),
),
padding:EdgeInsets.all(16),
child:Text("Ganti Tahun Ajaran", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:40,
minWidth:140,
),
),
],),
),
],),),
],),
)
;}
}