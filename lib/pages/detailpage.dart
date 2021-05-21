import 'package:flutter/material.dart';
import 'package:online_learning/widget/color_helper.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:online_learning/widget/text_widget.dart';

class DetailPage extends StatefulWidget {
  final String id;
  final String title;
  final String recentwatchtime;
  final String subtitle;
  final Image img;
  final String availableClasstitleone;
  final String availablewatchtimeone;
  final String availableClasstitletwo;
  final String availablewatchtimetwo;
  const DetailPage({
    Key key,
    this.img,
    this.id,
    this.title,
    this.recentwatchtime,
    this.subtitle,
    this.availableClasstitleone,
    this.availablewatchtimeone,
    this.availableClasstitletwo,
    this.availablewatchtimetwo,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(height: context.screenHeight * 0.4, child: widget.img),
              2.heightBox,
              text(
                widget.subtitle,
                textColor: indigoColor,
                size: context.textTheme.headline6.fontSize,
                fontWeight: FontWeight.bold,
              ),
              7.heightBox,
              text(
                widget.title,
                size: context.textTheme.headline5.fontSize,
                fontWeight: FontWeight.bold,
              ),
              7.heightBox,
              text(
                widget.recentwatchtime,
                size: context.textTheme.bodyText1.fontSize,
                textColor: greyColor,
                fontWeight: FontWeight.bold,
              ),
              18.heightBox,
              buildTextwithIcon(context,
                  labelText: "Start Listening", iconData: Icons.play_arrow),
              22.heightBox,
              text("Available Classes",
                  size: context.textTheme.headline6.fontSize,
                  fontWeight: FontWeight.bold),
              7.heightBox,
              buildlistAvailableClass(
                context,
                id: "01",
                textTitle: widget.availableClasstitleone,
                textsubtitle: widget.availablewatchtimeone,
              ),
              buildlistAvailableClass(
                context,
                id: "02",
                textTitle: widget.availableClasstitletwo,
                textsubtitle: widget.availablewatchtimetwo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildlistAvailableClass(BuildContext context,
      {String id, String textTitle, String textsubtitle}) {
    return ListTile(
      leading: text(id,
          size: context.textTheme.headline5.fontSize, textColor: greyColor),
      title: text(
        textTitle,
        fontWeight: FontWeight.bold,
        size: 18,
      ),
      subtitle: text(
        textsubtitle,
        fontWeight: FontWeight.bold,
        textColor: greyColor,
      ),
    );
  }

  Widget buildTextwithIcon(BuildContext context,
      {String labelText, IconData iconData}) {
    return Row(
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10.0,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: indigoColor,
                minimumSize: Size(
                    context.screenWidth * 0.2, context.screenHeight * 0.07),
              ),
              icon: Icon(iconData),
              label: text(
                labelText,
                fontWeight: FontWeight.bold,
                size: context.textTheme.headline6.fontSize,
              ),
            ),
          ),
        ),
        10.widthBox,
        Card(
          elevation: 10,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(
                    context.screenWidth * 0.02, context.screenHeight * 0.07),
              ),
              onPressed: () {},
              child: Icon(Icons.favorite_border)),
        ),
      ],
    );
  }
}
