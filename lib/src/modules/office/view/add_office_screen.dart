import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hashmicro_test/src/core/routes/app_pages.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_colors.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_fonts.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_size.dart';
import 'package:hashmicro_test/src/core/utils/field_validation.dart';
import 'package:hashmicro_test/src/core/widget/app_textfield.dart';
import 'package:hashmicro_test/src/core/widget/primary_button.dart';
import 'package:hashmicro_test/src/modules/office/controller/add_office_controller.dart';

class AddOfficeScreen extends GetView<AddOfficeController> {
  final formKey = GlobalKey<FormState>();

  AddOfficeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Add Office",
          style: AppFonts.primaryBoldTextStyle.copyWith(
            fontSize: AppSize.body,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.padding),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextfield(
                enabled: true,
                controller: controller.officeNameController,
                placeholder: "Enter office name",
                label: "Office Name",
                validator: (value) => FieldValidation(value)
                    .fieldName('Office name')
                    .isRequired()
                    .validate(),
              ),
              const SizedBox(
                height: AppSize.padding,
              ),
              Text(
                "Office Location",
                style: AppFonts.primarySemiBoldTextStyle,
              ),
              Text(
                "Drag marker to set office location",
                style: AppFonts.primaryLightTextStyle,
              ),
              const SizedBox(
                height: AppSize.padding,
              ),
              Expanded(
                child: Obx(
                  () => controller.intialLocation.value != null
                      ? Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppSize.radius),
                              child: Obx(
                                () => GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: controller.intialLocation.value!,
                                    zoom: 18,
                                  ),
                                  markers: {
                                    Marker(
                                      markerId:
                                          const MarkerId("pinLocationMarker"),
                                      position:
                                          controller.intialLocation.value!,
                                      icon: controller.officePinIcon.value,
                                      draggable: true,
                                      onDragEnd: (value) {
                                        controller.onDragMarker(value);
                                      },
                                    )
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      : const SizedBox(),
                ),
              ),
              const SizedBox(
                height: AppSize.padding,
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selected Office Location",
                      style: AppFonts.primaryLightTextStyle,
                    ),
                    const SizedBox(
                      height: AppSize.spaceSmall,
                    ),
                    Text(
                      controller.officeDetail.value,
                      style: AppFonts.primaryBoldTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.padding,
              ),
              Obx(
                () => Visibility(
                  visible: controller.isEdit.value,
                  child: PrimaryButton(
                    isLoading: controller.isLoading.value,
                    buttonText: "Cancel",
                    isHaveBottomPadding: true,
                    backgroundColor: AppColors.grey,
                    onPressed: () {
                      Get.offAllNamed(Routes.home);
                    },
                  ),
                ),
              ),
              Obx(
                () => PrimaryButton(
                  isLoading: controller.isLoading.value,
                  buttonText: "Save",
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;
                    controller.saveOffice();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
