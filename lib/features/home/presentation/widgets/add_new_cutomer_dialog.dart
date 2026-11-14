import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/business_date.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/providers/queue_controller.dart';

class AddNewCutomerDialog extends ConsumerStatefulWidget {
  const AddNewCutomerDialog({super.key});

  @override
  ConsumerState<AddNewCutomerDialog> createState() =>
      _AddNewCutomerDialogState();
}

class _AddNewCutomerDialogState extends ConsumerState<AddNewCutomerDialog> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final notesController = TextEditingController();
  final dateController = TextEditingController();
  DateTime? _pickedDate;
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

  void _submit() {
    if (!formKey.currentState!.validate()) return;

    final notes = notesController.text.trim();
    ref
        .read(queueControllerProvider.notifier)
        .addNew(
          name: nameController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          visitDate: dateKey(_pickedDate!),
          notes: notes.isEmpty ? null : notes,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(queueControllerProvider, (prev, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.locale.somethingWentWrong)),
        );
      } else if (prev?.isLoading == true && next is AsyncData) {
        context.pop();
      }
    });
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
            verticalSpace(8),
            Form(
              key: formKey,
              // autovalidateMode: .onUserInteraction,
              child: Column(
                children: [
                  // --------------------------- Name ----------------------------
                  CustomTextField(
                    controller: nameController,
                    validator: (value) =>
                        requiredFieldValidator(context, value),
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
                          _pickedDate = await showDatePicker(
                            context: context,
                            initialDate: currentBusinessDate(DateTime.now()),
                            firstDate: currentBusinessDate(DateTime.now()),
                            lastDate: DateTime.now().add(Duration(days: 30)),
                          );

                          if (_pickedDate != null) {
                            setState(() {
                              dateController.text = context.dateFormater(
                                _pickedDate!,
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
          onPressed: _submit,
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
