import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key, required this.onClick,
  });
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
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
                  offset: Offset(5, 5)
              )
            ],
          ),

          height: widgetHeight(100),

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    child: Image.asset(
                      'images/clientPic.jpg',
                      fit: BoxFit.fill,
                      height: widgetHeight(75),
                      width: widgetWidth(75),
                    ),
                  ),
                ),
                SizedBox(
                  width: widgetWidth(14),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'House Wiring',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),

                      ),
                      SizedBox(
                        height: widgetHeight(6),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: electricianServiceIconColor,
                          ),
                          SizedBox(
                            width: widgetWidth(5),
                          ),
                          const Text(
                              'Usama'
                          ),
                        ],
                      ),
                      SizedBox(
                        height: widgetHeight(5),
                      ),
                      Text(
                        '(3.4) ⭐',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: electricianServiceRatingColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.bookmark_border_outlined,
                        size: 28,
                      ),
                      Text(
                        '1000 pkr',
                        style: TextStyle(
                          fontSize: 18,
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
