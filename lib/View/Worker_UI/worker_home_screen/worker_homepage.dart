import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/Worker_UI/Customs_Widgets/about_jobs_custom.dart';
import 'package:jobvortex/View/Worker_UI/Details_Pages/job_details_worker.dart';

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
      ),
      body: Column(
        children: [
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JobDetails()));
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
