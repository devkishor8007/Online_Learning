import 'dart:convert';
import 'package:online_learning/model/image_model.dart';
import 'package:online_learning/pages/detailpage.dart';
import 'package:online_learning/widget/appbar_widget.dart';
import 'package:online_learning/widget/color_helper.dart';
import 'package:online_learning/widget/text_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: indigoColor,
      appBar: appBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: Icon(
          Icons.short_text,
          color: blackColor,
          size: 29,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.04,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: blackColor,
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: context.screenHeight * 0.8,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.02,
                  vertical: context.screenHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    'Hello Valerie Elash',
                    textColor: indigoColor,
                    size: context.textTheme.headline6.fontSize,
                  ),
                  5.heightBox,
                  text(
                    'Your Progress',
                    fontWeight: FontWeight.bold,
                    size: context.textTheme.headline4.fontSize,
                  ),
                  20.heightBox,
                  buildProgressStatus(context),
                  30.heightBox,
                  buildRowText(context,
                      title: "Recent Course", titletwo: "See All"),
                  20.heightBox,
                  buildlistcourse(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProgressStatus(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.005,
      child: Slider(
        activeColor: amberColor,
        value: _val,
        onChanged: (value) {
          setState(() {
            _val = value;
          });
        },
      ),
    );
  }

  Widget buildRowText(BuildContext context, {String title, String titletwo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          title,
          fontWeight: FontWeight.bold,
          size: context.textTheme.headline6.fontSize,
        ),
        text(
          titletwo,
          textColor: indigoColor,
          fontWeight: FontWeight.bold,
          size: context.textTheme.headline6.fontSize,
        ),
      ],
    );
  }

  Widget buildlistcourse(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.4,
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/user.json'),
        builder: (_, snapshot) {
          var data = json.decode(snapshot.data.toString());
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        img: img[index],
                        id: data[index]['id'],
                        title: data[index]['title'],
                        subtitle: data[index]['subtittle'],
                        recentwatchtime: data[index]['recentwatchtime'],
                        availableClasstitleone: data[index]['availableClassone']
                            ['title'],
                        availablewatchtimeone: data[index]['availableClassone']
                            ['availablewatchtime'],
                        availableClasstitletwo: data[index]['availableClasstwo']
                            ['title'],
                        availablewatchtimetwo: data[index]['availableClasstwo']
                            ['availablewatchtime'],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: img[index],
                  title: text("${data[index]['title']}",
                      fontWeight: FontWeight.bold),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      5.heightBox,
                      text("${data[index]['subtittle']}",
                          textColor: blackColor),
                      2.heightBox,
                      text("${data[index]['recentwatchtime']}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
