import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashmicro_test/src/core/extension/string_ext.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_colors.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_fonts.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_size.dart';
import 'package:hashmicro_test/src/modules/attendance/controller/attendance_controller.dart';

class AttendanceScreen extends GetView<AttendanceController> {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Attendance History",
          style: AppFonts.primaryBoldTextStyle.copyWith(fontSize: AppSize.body),
        ),
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.navigate_before,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.attendances.length,
          itemBuilder: (context, index) {
            final attendance = controller.attendances[index];
            return Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppSize.padding, vertical: AppSize.spaceSmall),
              padding: const EdgeInsets.all(AppSize.smallPadding),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    spreadRadius: 2,
                    blurRadius: 30,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  AppSize.radius,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 150,
                    padding: const EdgeInsets.all(AppSize.extraSmallPadding),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(AppSize.smallRadius)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: AppColors.primaryColor,
                          size: 16,
                        ),
                        const SizedBox(width: AppSize.extraSmallPadding,),
                        Text(
                          attendance.time?.toTimeFormat() ?? "",
                          style: AppFonts.primarySemiBoldTextStyle.copyWith(
                            fontSize: AppSize.caption,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.smallPadding,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Status",
                              style: AppFonts.primaryLightTextStyle
                                  .copyWith(fontSize: AppSize.caption),
                            ),
                            Text(
                              attendance.isValid ?? false
                                  ? "Success"
                                  : "Rejected",
                              style: attendance.isValid ?? false
                                  ? AppFonts.greenBoldTextStyle
                                  : AppFonts.redRegularTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Distance",
                              style: AppFonts.primaryLightTextStyle
                                  .copyWith(fontSize: AppSize.caption),
                            ),
                            Text(
                              "${(attendance.distance ?? 0).toStringAsFixed(0)} M",
                              style: AppFonts.primaryBoldTextStyle
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
