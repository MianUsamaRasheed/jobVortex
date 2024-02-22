import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class WorkerNotificationScreen extends StatelessWidget {
  const WorkerNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: const Color(0xFFE8F5FF),
          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: electricianServiceAppBarIconColor,
            ),
            backgroundColor: electricianServiceAppBarBackGroundColor,
            title: const Text(
              "Notifications",
              style: TextStyle(
                  color: electricianServiceAppBarTextColor,
                  fontFamily: 'Poppins'),
            ),
          ),
          body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: widgetWidth(14)),
                isThreeLine: true,
                //tileColor: Colors.white,
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("images/splashPic.jpg"),
                ),
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "JobVortex",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                    ),
                    Text(
                      "2h Ago",
                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                subtitle: const Text(
                  "🎉 Welcome to JobVortex! 🎉,We are thrilled to welcome you to JobVortex, your ultimate destination for connecting with the best job opportunities in your field. ",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey[400],
                thickness: 0.3,
                indent: widgetWidth(30),
                endIndent: widgetWidth(30),
              );
            },
            itemCount: 3,
          )),
    );
  }
}
