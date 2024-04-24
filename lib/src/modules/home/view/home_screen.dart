import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hashmicro_test/src/core/routes/app_pages.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_colors.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_fonts.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_size.dart';
import 'package:hashmicro_test/src/core/widget/primary_button.dart';
import 'package:hashmicro_test/src/modules/home/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.myLocation.value != null
            ? Stack(
                fit: StackFit.loose,
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: controller.officeLocation.value ??
                          const LatLng(-6.917464, 107.619125),
                      zoom: 18,
                    ),
                    mapType: MapType.normal,
                    markers: controller.mapMarker,
                    myLocationEnabled: true,
                    circles: controller.mapCircle,
                    onMapCreated: (mapController) async {
                      if (!controller.mapCon.isCompleted) {
                        controller.mapCon.complete(mapController);
                      }
                    },
                  ),
                  Positioned(
                    top: AppSize.bigPadding,
                    left: AppSize.padding,
                    child: SafeArea(
                      child: Column(
                        children: [
                          PrimaryButton(
                            width: 150,
                            isHaveBottomPadding: true,
                            buttonText: "Office Location",
                            onPressed: () {
                              Get.offAllNamed(
                                Routes.addOffice,
                                arguments: controller.officeLocationModel.value,
                              );
                            },
                          ),
                          PrimaryButton(
                            width: 150,
                            isHaveBottomPadding: true,
                            buttonText: "History",
                            onPressed: () {
                              Get.toNamed(
                                Routes.attendance,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSize.smallPadding),
                      margin: const EdgeInsets.all(AppSize.padding),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppSize.radius)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Location",
                            style: AppFonts.primaryBoldTextStyle,
                          ),
                          const SizedBox(
                            height: AppSize.extraSmallPadding,
                          ),
                          Text(
                            controller.myLocationDetail.value,
                            style: AppFonts.primaryLightTextStyle
                                .copyWith(fontSize: AppSize.caption),
                          ),
                          const SizedBox(
                            height: AppSize.padding,
                          ),
                          Container(
                            padding: const EdgeInsets.all(AppSize.spaceSmall),
                            decoration: BoxDecoration(
                                color: AppColors.green.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(AppSize.radius)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Office Location",
                                  style: AppFonts.primaryBoldTextStyle,
                                ),
                                const SizedBox(
                                  height: AppSize.extraSmallPadding,
                                ),
                                Text(
                                  controller.officeDetail.value,
                                  style: AppFonts.primaryLightTextStyle,
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Distance: ${controller.distance.value.toStringAsFixed(0)} meter",
                            style: AppFonts.primaryLightTextStyle,
                          ),
                          const SizedBox(
                            height: AppSize.smallPadding,
                          ),
                          Obx(
                            () => PrimaryButton(
                              isLoading: controller.isLoading.value,
                              buttonText: "Check-In",
                              onPressed: () {
                                controller.insertAttendance();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            :  CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}
