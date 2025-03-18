import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sports_booking/app_ui/utils.dart';
import 'package:sports_booking/app_ui/widgets/border_radius.dart';
import 'package:sports_booking/app_ui/widgets/padding.dart';
import 'package:sports_booking/app_ui/widgets/text.dart';
import 'package:sports_booking/core/presentation/widgets/app_button.dart';
import 'package:sports_booking/core/presentation/widgets/app_textfield.dart';
import 'package:ticket_widget/ticket_widget.dart';

class LoginSignUpContainer extends StatelessWidget {
  const LoginSignUpContainer({
    super.key,
    this.emailErrorText,
    this.passwordErrorText,
    required this.onGetStartedTap,
    required this.onGoogleIconTap,
    required this.isLoading,
    required this.onAuthTypeChange,
    required this.isAuthLoginType,
    required this.onEmailChange,
    required this.onPasswordChange,
  });

  final String? emailErrorText;
  final String? passwordErrorText;
  final VoidCallback onGetStartedTap;
  final VoidCallback onGoogleIconTap;
  final bool isLoading;
  final VoidCallback onAuthTypeChange;
  final bool isAuthLoginType;
  final Function(String) onEmailChange;
  final Function(String) onPasswordChange;

  @override
  Widget build(BuildContext context) {
    return TicketWidget(
      width: double.infinity,
      height: 425,
      isCornerRounded: true,
      child: Container(
        padding: EdgeInsets.all(Insets.large24),
        decoration: BoxDecoration(
          color: context.colorScheme.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.small8),
        ),
        child: Center(
          child: Column(
            spacing: Insets.medium16,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.medium(text: isAuthLoginType ? 'Login' : 'Signup'),
              AppTextField(
                errorText: emailErrorText,
                hintText: 'Enter Email',
                isPasswordField: false,
                onChange: onEmailChange,
              ),
              AppTextField(
                errorText: passwordErrorText,
                hintText:
                    isAuthLoginType ? 'Enter Password' : 'Create Password',
                isPasswordField: true,
                onChange: onPasswordChange,
              ),
              AppButton(
                label: 'Get Started',
                onTap: onGetStartedTap,
                isLoading: isLoading,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: Insets.xsmall8,
                children: [
                  Expanded(child: Divider(color: context.colorScheme.grey)),
                  AppText.small(text: 'Or'),
                  Expanded(child: Divider(color: context.colorScheme.grey)),
                ],
              ),
              GestureDetector(onTap: onGoogleIconTap, child: GooglePhoto()),
              RichText(
                text: TextSpan(
                  text:
                      isAuthLoginType
                          ? 'Already have an account? '
                          : 'Create new account ',
                  style: TextStyle(
                    color: context.colorScheme.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer()..onTap = onAuthTypeChange,
                      text: isAuthLoginType ? 'Sign up' : 'Login',
                      style: TextStyle(
                        color: context.colorScheme.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GooglePhoto extends StatelessWidget {
  const GooglePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.xsmall8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.large20),
        border: Border.all(color: context.colorScheme.grey),
      ),
      child: Image.asset('assets/google.png', height: 16),
    );
  }
}

class TicketContainer extends StatelessWidget {
  const TicketContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.large20),
        color: Colors.red,
      ),
    );
  }
}
