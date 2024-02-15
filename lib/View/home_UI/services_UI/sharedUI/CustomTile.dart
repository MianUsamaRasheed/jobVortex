import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class CustomTile extends StatelessWidget {
  final VoidCallback onClick;
  final String service;
  final String name;
  final String reviewRating;
  final String pricePkr;
  final String imagePath;
  const CustomTile(
      {super.key,
      required this.onClick,
      required this.service,
      required this.name,
      required this.reviewRating,
      required this.pricePkr,
      required this.imagePath});
  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            color: electricianServiceContainerColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: electricianServiceBoxShadowColor,
                  blurRadius: 3.0,
                  offset: Offset(5, 5))
            ],
          ),
          height: widgetHeight(110),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      imagePath.toString(),
                      fit: BoxFit.cover,
                      height: widgetHeight(110),
                      width: widgetWidth(85),
                    ),
                  ),
                ),
                SizedBox(
                  width: widgetWidth(14),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: widgetWidth(2)),
                          child: Container(
                            height: 25,
                            width: 250,
                            child: Text(
                              service.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Poppins'

                              ),
                            ),
                          )),
                      SizedBox(
                        height: widgetHeight(6),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: widgetWidth(10)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: electricianServiceIconColor,
                            ),
                            SizedBox(
                              width: widgetWidth(5),
                            ),
                            Text(name.toString(), style: TextStyle(fontFamily: 'Poppins'),),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: widgetHeight(10),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: widgetWidth(105)),
                        child: Text(
                          '${reviewRating.toString()} ⭐',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: electricianServiceRatingColor,
                              fontSize: 14, fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.bookmark_border_outlined,
                        size: 28,
                      ),
                      Text(
                        '${pricePkr.toString()} pkr',
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins'
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
