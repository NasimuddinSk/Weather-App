import 'package:intl/intl.dart';

String timeFormatter({int? unixTimestamp, bool isTime = false}) {
  if (unixTimestamp == null) {
    DateTime localDateTime =
        DateTime.fromMillisecondsSinceEpoch(
          DateTime.now().millisecondsSinceEpoch,
          //  unixTimestamp * 1000,
          isUtc: true,
        ).toLocal();

    return DateFormat.yMMMMd().add_jm().format(localDateTime);
  } else if (isTime) {
    DateTime localDateTime =
        DateTime.fromMillisecondsSinceEpoch(
          unixTimestamp * 1000,
          isUtc: true,
        ).toLocal();
    return DateFormat.jm().format(localDateTime);
  } else {
    DateTime localDateTime =
        DateTime.fromMillisecondsSinceEpoch(
          unixTimestamp * 1000,
          isUtc: true,
        ).toLocal();

    return DateFormat.yMMMMd().add_jm().format(localDateTime);
  }
}

String formatMonthDay({required int unixTimestamp}) {
  DateTime localDateTime =
      DateTime.fromMillisecondsSinceEpoch(
        unixTimestamp * 1000,
        isUtc: true,
      ).toLocal();

  return DateFormat.MMMMd().format(localDateTime);
}

// void dd() {
//   int unixTimestamp = 1746792000; // Your "dt" value

//   // Convert Unix timestamp (seconds) to DateTime
//   // Unix timestamps are typically in seconds, so multiply by 1000 for milliseconds
//   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);

//   // Now format it using DateFormat from the intl package

//   // Example 1: Default short date and time based on locale
//   // For this to work best with specific locales, you might need to initialize date formatting data.
//   // await initializeDateFormatting('en_US', null); // Example for US English
//   // For many common formats, explicit initialization might not be strictly needed for basic patterns.

//   print(
//     'Original DateTime: $dateTime',
//   ); // Default ISO 8601 format: 2025-05-09 12:00:00.000Z (if UTC)
//   // Or local time representation depending on how DateTime handles it.
//   // The timestamp 1746792000 is 2025-05-09 12:00:00 UTC

//   // Let's assume you want to display it in a specific local timezone.
//   // By default, fromMillisecondsSinceEpoch creates a UTC DateTime.
//   // If you want it in the local timezone of the device:
//   DateTime localDateTime =
//       DateTime.fromMillisecondsSinceEpoch(
//         unixTimestamp * 1000,
//         isUtc: true,
//       ).toLocal();
//   print(
//     'Local DateTime: $localDateTime',
//   ); // 2025-05-09 17:30:00.000 (if your local is IST, which is UTC+5:30)

//   // --- Common DateFormat Patterns ---

//   // Example 2: Date with month name, day, year (e.g., May 9, 2025)
//   String formattedDate1 = DateFormat.yMMMMd().format(localDateTime);
//   print('Formatted (yMMMMd): $formattedDate1');

//   // Example 3: Short date (e.g., 5/9/25)
//   String formattedDate2 = DateFormat.yMd().format(localDateTime);
//   print('Formatted (yMd): $formattedDate2');

//   // Example 4: Date and time (e.g., May 9, 2025 5:30 PM)
//   String formattedDateTime1 = DateFormat.yMMMMd().add_jm().format(
//     localDateTime,
//   );
//   print('Formatted (yMMMMd jm): $formattedDateTime1');

//   // Example 5: Just time (e.g., 5:30:00 PM)
//   String formattedTime1 = DateFormat.jms().format(localDateTime);
//   print('Formatted (jms): $formattedTime1');

//   // Example 6: Custom format (e.g., Fri, 09 May 2025 - 17:30)
//   String formattedCustom = DateFormat(
//     'E, dd MMM yyyy - HH:mm',
//   ).format(localDateTime);
//   print('Formatted (Custom): $formattedCustom');

//   // Example 7: Using a specific locale (e.g., German)
//   // You might need to initialize formatting for specific locales for full names, etc.
//   // await initializeDateFormatting('de_DE', null);
//   String formattedGerman = DateFormat.yMMMMd('de_DE').format(localDateTime);
//   print('Formatted (German yMMMMd): $formattedGerman'); // Example: 9. Mai 2025

//   String formattedFullGerman = DateFormat.EEEE(
//     'de_DE',
//   ).add_yMMMMd('de_DE').add_Hms('de_DE').format(localDateTime);
//   print(
//     'Formatted (Full German): $formattedFullGerman',
//   ); // Example: Freitag, 9. Mai 2025 17:30:00

//   // --- Using your provided JSON example's dt_txt as a reference ---
//   // "dt_txt": "2025-05-09 12:00:00" (This dt_txt from your JSON is likely UTC)
//   // The timestamp 1746792000 also corresponds to 2025-05-09 12:00:00 UTC.

//   // Formatting the UTC DateTime object directly:
//   DateTime utcDateTime = DateTime.fromMillisecondsSinceEpoch(
//     unixTimestamp * 1000,
//     isUtc: true,
//   );
//   print('UTC DateTime: $utcDateTime'); // 2025-05-09 12:00:00.000Z

//   String formattedLikeDtTxt = DateFormat(
//     'yyyy-MM-dd HH:mm:ss',
//   ).format(utcDateTime);
//   print(
//     'Formatted like dt_txt (UTC): $formattedLikeDtTxt',
//   ); // 2025-05-09 12:00:00

//   // If you want to show it in Indian Standard Time (IST is UTC+05:30)
//   // which is my current local time based on the context you provided.
//   String formattedIST = DateFormat(
//     'E, dd MMM yyyy hh:mm:ss a zzzz',
//   ).format(localDateTime);
//   print(
//     'Formatted (IST): $formattedIST',
//   ); // Example: Fri, 09 May 2025 05:30:00 PM India Standard Time
// }

// // If you are running this in a Flutter app, you might want to initialize date formatting
// // in your main.dart or an appropriate initialization spot, especially for non-default locales.
// /*
// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Important for Flutter
//   await initializeDateFormatting('de_DE', null); // Example for German
//   await initializeDateFormatting('en_IN', null); // Example for English (India)
//   // ... then run your app or the formatting code
//   runApp(MyApp());
// }
// */
