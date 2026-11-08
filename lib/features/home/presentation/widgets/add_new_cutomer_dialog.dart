import 'package:durak_app/core/helpers/extensions.dart';
import 'package:durak_app/core/helpers/spacer.dart';
import 'package:durak_app/core/widgets/custom_button.dart';
import 'package:durak_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewCutomerDialog extends StatefulWidget {
  const AddNewCutomerDialog({super.key});

  @override
  State<AddNewCutomerDialog> createState() => _AddNewCutomerDialogState();
}

class _AddNewCutomerDialogState extends State<AddNewCutomerDialog> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final notesController = TextEditingController();
  final dateController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    notesController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _importContact() async {
    final contact = await FlutterNativeContactPicker().selectPhoneNumber();
    if (contact == null) return;
    if (!mounted) return;

    setState(() {
      nameController.text = contact.fullName ?? '';
      phoneNumberController.text = _cleanPhoneNumber(
        contact.selectedPhoneNumber ?? '',
      );
    });
  }

  String _cleanPhoneNumber(String raw) => raw.replaceAll(RegExp(r'[^\d+]'), '');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.locale.addnewcustomer, textAlign: .center),
      titlePadding: EdgeInsets.symmetric(vertical: 12.h),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: .min,
          children: [
            CustomButton(
              onPressed: _importContact,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
              backgroundColor: context.themeData.colorScheme.primary,
              child: Text(context.locale.addfromcontacts),
            ),
            verticalSpace(16),
            Divider(
              color: context.themeData.colorScheme.onSurface.withValues(
                alpha: 0.4,
              ),
              thickness: 0.8,
            ),
            // Text(
            //   context.locale.addmanually,
            //   style: TextStyle(fontWeight: .w300, fontSize: 10.sp),
            // ),
            verticalSpace(8),
            Form(
              key: formKey,
              child: Column(
                children: [
                  // --------------------------- Name ----------------------------
                  CustomTextField(
                    controller: nameController,
                    validator: (value) =>
                        requiredFieldValidator(context, value),
                    onChanged: (_) => setState(() {}),
                    label: context.locale.namelabel,
                    hint: context.locale.namehint,
                  ),
                  verticalSpace(12),
                  // --------------------------- PhoneNumber ---------------------
                  CustomTextField(
                    controller: phoneNumberController,
                    textDirection: .ltr,
                    validator: (value) =>
                        requiredFieldValidator(context, value),
                    onChanged: (_) => setState(() {}),
                    label: context.locale.phonenumberlabel,
                    hint: context.locale.phonenumberhint,
                    keyboardType: .phone,
                  ),
                  verticalSpace(12),
                  // --------------------------- Date Picker ---------------------
                  Row(
                    children: [
                      CustomButton(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 30)),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              dateController.text = context.dateFormater(
                                pickedDate,
                              );
                            });
                          }
                        },
                        padding: .symmetric(vertical: 16.h),
                        child: Icon(Icons.date_range),
                      ),
                      horizontalSpace(12),
                      Expanded(
                        child: CustomTextField(
                          controller: dateController,
                          enabled: false,
                          validator: (value) =>
                              requiredFieldValidator(context, value),
                          label: context.locale.datelabel,
                          hint: context.locale.datehint,
                        ),
                      ),
                    ],
                  ),
                  // --------------------------- Notes ---------------------------
                  verticalSpace(12),
                  CustomTextField(
                    controller: notesController,
                    label: context.locale.noteslabel,
                    hint: context.locale.noteshint,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        CustomButton(
          onPressed:
              formKey.currentState != null && formKey.currentState!.validate()
              ? () {}
              : null, // if text fields is validated then enable it
          backgroundColor: context.themeData.colorScheme.primary,
          child: Text(context.locale.add),
        ),
        horizontalSpace(12),
        CustomButton(
          onPressed: () => context.pop(),
          child: Text(context.locale.cancel),
        ),
      ],
    );
  }
}

String? requiredFieldValidator(BuildContext context, String? value) {
  if (value != null && value.isNotEmpty) {
    return null;
  } else {
    return context.locale.requiredfield;
  }
}
