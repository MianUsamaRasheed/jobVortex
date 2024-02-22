import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/Worker_UI/Customs_Widgets/about_jobs_custom.dart';
import 'package:jobvortex/View/Worker_UI/Details_Pages/job_details_worker.dart';
import 'package:jobvortex/View/Worker_UI/worker_home_screen/Add_Worker_job/add_job.dart';

class WorkerHomePage extends StatelessWidget {
  const WorkerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5FF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueAppThemeColor,
        automaticallyImplyLeading: false,
        title: const PoppinsTextStyle(
            text: "Homepage", textSize: 21, color: Colors.white, isBold: false),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.logout_outlined, color: Colors.white,)),
      ),
      body: Column(
        children: [
          Container(
            height: widgetHeight(80),
            width: widgetWidth(double.infinity),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DummyGreyContainer(
                    heightD: widgetHeight(30),
                    widthD: widgetWidth(150),
                    colorVisible: false,
                    child: const PoppinsTextStyle(
                        text: "Add your Job",
                        textSize: 20,
                        color: Colors.black,
                        isBold: false)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddTheJob()));
                  },
                  child: Container(
                    height: widgetHeight(45),
                    width: widgetWidth(90),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: blueAppThemeColor),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PoppinsTextStyle(
                            text: "Add",
                            textSize: 17,
                            color: Colors.white,
                            isBold: false),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 21,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: widgetHeight(30),
            child: const Divider(
              color: lightBlueAppTheme,
              thickness: 3,
            ),
          ),
          SizedBox(
            height: widgetHeight(20),
          ),
          const PoppinsTextStyle(
              text: "Incoming Jobs",
              textSize: 18,
              color: Colors.grey,
              isBold: true),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: widgetWidth(10), left: widgetWidth(10)),
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return IncomingJobsAlert(
                      jobText: job[index],
                      jobType: typeJob[index],
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const JobDetails()));
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
