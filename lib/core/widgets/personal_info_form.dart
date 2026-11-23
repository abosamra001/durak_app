import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/profile_repository.dart';
import '../helpers/extensions.dart';
import '../helpers/spacer.dart';
import '../helpers/validators.dart';
import '../providers/profile_controller.dart';
import '../providers/profile_repository_provider.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'snackbars.dart';

class PersonalInfoForm extends ConsumerStatefulWidget {
  final VoidCallback onDone;
  final VoidCallback? onCanceled;
  const PersonalInfoForm({super.key, required this.onDone, this.onCanceled});

  @override
  ConsumerState<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends ConsumerState<PersonalInfoForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final shopNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _changePersonalInfo() async {
    if (!formKey.currentState!.validate()) return;

    final updatedProfile = Profile(
      name: nameController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      shopName: shopNameController.text.trim(),
    );

    await ref
        .read(profileControllerProvider.notifier)
        .saveProfile(updatedProfile);

    if (!mounted) return;
    if (!ref.read(profileControllerProvider).hasError) {
      widget.onDone();
    }
  }

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileProvider);

    if (profile.name.isEmpty) return;

    nameController.text = profile.name;
    shopNameController.text = profile.shopName;
    phoneController.text = profile.phoneNumber;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    shopNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileControllerProvider, (prev, next) {
      if (next is AsyncError) showErrorSnackBar(context);
    });
    final isSaving = ref.watch(profileControllerProvider).isLoading;
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Name text field
          CustomTextField(
            controller: nameController,
            label: context.locale.namelabel,
            hint: context.locale.namehint,
            fillColor: context.themeData.colorScheme.onPrimary,
            validator: (value) => requiredFieldValidator(context, value),
          ),
          verticalSpace(12),
          // Shop name text field
          CustomTextField(
            controller: shopNameController,
            label: context.locale.shopnamelabel,
            hint: context.locale.shopnamehint,
            fillColor: context.themeData.colorScheme.onPrimary,
            validator: (value) => requiredFieldValidator(context, value),
          ),
          verticalSpace(12),
          // Phone  text field
          CustomTextField(
            controller: phoneController,
            textDirection: .ltr,
            keyboardType: .phone,
            label: context.locale.phonenumberlabel,
            hint: context.locale.phonenumberhint,
            fillColor: context.themeData.colorScheme.onPrimary,
            validator: (value) => phoneValidator(context, value),
          ),
          verticalSpace(24),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: isSaving ? null : _changePersonalInfo,
                    child: Text(context.locale.save),
                  ),
                ),
                if (widget.onCanceled != null)
                  TextButton(
                    onPressed: widget.onCanceled,
                    child: Text(
                      context.locale.cancel,
                      style: context.themeData.textTheme.bodyMedium,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
