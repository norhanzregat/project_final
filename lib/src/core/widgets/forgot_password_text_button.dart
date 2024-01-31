import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../utils/app_text_styles.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: () {
        _showEmailDialog(context);
      },
      child: Text(
        'Forgot Password?',
        style: AppTextStyles.textStyle14Medium,
      ),
    );
  }

  void _showEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter your email'),
          content: TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _sendPasswordResetEmail(context);
              },
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }

  void _sendPasswordResetEmail(BuildContext context) async {
    // Replace the placeholders with your email server details
    final smtpServer = gmail('your_email@gmail.com', 'your_password');

    // Create the email message
    final message = Message()
      ..from = Address('your_email@gmail.com', 'Your Name')
      ..recipients.add(emailController.text)
      ..subject = 'Password Reset'
      ..text = 'Your password reset link: https://example.com/reset-password';

    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      Fluttertoast.showToast(
        msg: 'Password reset link sent to ${emailController.text}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.of(context).pop(); // Close the email dialog
    } catch (e) {
      print('Error sending email: $e');
      Fluttertoast.showToast(
        msg: ' Please try again later.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
