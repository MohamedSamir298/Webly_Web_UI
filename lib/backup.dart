// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, context) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             brightness: Brightness.dark,
//             scaffoldBackgroundColor: const Color(0xFF000000),
//             primaryColor: const Color(0xFFFFC268),
//             textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
//           ),
//           home: const MainLayout(),
//         );
//       },
//     );
//   }
// }
//
// class MainLayout extends StatelessWidget {
//   const MainLayout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> imagePaths = [
//       'assets/images/item_cover1.png',
//       'assets/images/item_cover2.png',
//       'assets/images/item_cover3.png',
//       'assets/images/item_cover1.png',
//       'assets/images/item_cover2.png',
//       'assets/images/item_cover3.png',
//       'assets/images/item_cover1.png',
//       'assets/images/item_cover2.png',
//       'assets/images/item_cover3.png',
//     ];
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final isMobile = constraints.maxWidth < 600;
//           if (isMobile) {
//             // MOBILE LAYOUT
//             return Column(
//               children: [
//                 const CustomMobileHeader(),
//                 // Main Content
//                 Expanded(
//                   child: Container(
//                     color: const Color(0xFF000000),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Title
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8, bottom: 16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text('Items', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white)),
//                                 SvgPicture.asset('assets/filter.svg', width: 40),
//                               ],
//                             ),
//                           ),
//                           // Cards (single column)
//                           Expanded(
//                             child: ListView.separated(
//                               padding: EdgeInsets.zero,
//                               itemCount: 8,
//                               separatorBuilder: (context, i) => const SizedBox(height: 20),
//                               itemBuilder: (context, index) => ItemCard(isMobile: true, imagePath: imagePaths[index]),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             // DESKTOP/TABLET LAYOUT (NO SIDEBAR)
//             return Column(
//               children: [
//                 const CustomHeader(),
//                 // Main Content
//                 Expanded(
//                   child: Container(
//                     color: const Color(0xFF000000),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Title
//
//                           // const SizedBox(height: 32),
//                           // Action Row
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             child: Row(
//                               children: [
//                                 const Text('Items', style: TextStyle(fontSize: 32, fontWeight: FontWeight.normal, color: Colors.white)),
//                                 Spacer(),
//                                 // Filter icon
//                                 // Container(
//                                 //   decoration: BoxDecoration(
//                                 //     color: const Color(0xFF232325),
//                                 //     borderRadius: BorderRadius.circular(24),
//                                 //   ),
//                                 //   padding: const EdgeInsets.all(10),
//                                 //   child: const Icon(Icons.filter_alt_outlined, color: Colors.white70, size: 24),
//                                 // ),
//                                 SvgPicture.asset('assets/filter.svg'),
//                                 Container(height: 48, width: 1, margin: const EdgeInsets.symmetric(horizontal: 12), color: Color(0xFF262626)),
//                                 // Add a New Item button
//                                 ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Theme.of(context).primaryColor,
//                                     foregroundColor: Colors.black,
//                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
//                                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//                                     textStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
//                                   ),
//                                   onPressed: () {},
//                                   child: Row(spacing: 8, children: [SvgPicture.asset('assets/add.svg'), const Text('Add a New Item')]),
//                                   // label: const Text('Add a New Item'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           // Responsive Grid of Cards
//                           Expanded(
//                             child: LayoutBuilder(
//                               builder: (context, constraints) {
//                                 // Responsive column count
//                                 int crossAxisCount = 5;
//                                 if (constraints.maxWidth < 1500) crossAxisCount = 4;
//                                 if (constraints.maxWidth < 1200) crossAxisCount = 3;
//                                 if (constraints.maxWidth < 900) crossAxisCount = 2;
//                                 if (constraints.maxWidth < 600) crossAxisCount = 1;
//                                 return GridView.builder(
//                                   padding: EdgeInsets.symmetric(vertical: 24),
//                                   itemCount: 8,
//                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: crossAxisCount,
//                                     crossAxisSpacing: 16,
//                                     mainAxisSpacing: 20,
//                                     childAspectRatio: 243 / 322,
//                                   ),
//                                   itemBuilder: (context, index) => ItemCard(imagePath: imagePaths[index]),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// class CustomMobileHeader extends StatelessWidget {
//   const CustomMobileHeader({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           height: 72,
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//             color: Colors.black,
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))],
//           ),
//           child: Row(
//             children: [
//               IconButton(icon: SvgPicture.asset('assets/menu.svg'), onPressed: () {}),
//               const SizedBox(width: 8),
//               SvgPicture.asset('assets/logo.svg'),
//               const Spacer(),
//               // Icons
//               Row(
//                 children: [
//                   IconButton(icon: SvgPicture.asset('assets/settings.svg'), onPressed: () {}),
//                   IconButton(icon: SvgPicture.asset('assets/notifications.svg'), onPressed: () {}),
//                 ],
//               ),
//               // Vertical divider between icons and profile
//               Container(height: 24, width: 1, margin: const EdgeInsets.symmetric(horizontal: 12), color: Color(0xFF262626)),
//               // Profile
//               CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/images/human_img1.png')),
//             ],
//           ),
//         ),
//         Container(height: 1.5, color: Color(0xFF262626)),
//       ],
//     );
//   }
// }
//
// class CustomHeader extends StatelessWidget {
//   const CustomHeader({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 76,
//           padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
//           decoration: BoxDecoration(
//             color: Colors.black,
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))],
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Logo
//               SvgPicture.asset('assets/logo.svg'),
//               SizedBox(width: 30),
//               Expanded(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child: SingleChildScrollView(
//                         physics: BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           spacing: 32,
//                           children: [
//                             _HeaderTab(title: 'Items', selected: true),
//                             _HeaderTab(title: 'Pricing'),
//                             _HeaderTab(title: 'Info'),
//                             _HeaderTab(title: 'Tasks'),
//                             _HeaderTab(title: 'Analytics'),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Vertical divider between tabs and icons
//                     Container(height: 24, width: 1, margin: const EdgeInsets.symmetric(horizontal: 24), color: Color(0xFF262626)),
//                     // Actions (settings, notifications)
//                     Row(
//                       spacing: 8,
//                       children: [
//                         IconButton(icon: SvgPicture.asset('assets/settings.svg'), onPressed: () {}),
//                         IconButton(icon: SvgPicture.asset('assets/notifications.svg'), onPressed: () {}),
//                       ],
//                     ),
//                     // Vertical divider between icons and profile
//                     Container(height: 24, width: 1, margin: const EdgeInsets.symmetric(horizontal: 24), color: Color(0xFF262626)),
//                     // Profile
//                     Row(
//                       children: [
//                         CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/images/human_img1.png')),
//                         const SizedBox(width: 10),
//                         Text('John Doe', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
//                         const SizedBox(width: 4),
//                         const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         // Horizontal divider below header
//         Container(height: 1.5, color: Color(0xFF262626)),
//       ],
//     );
//   }
// }
//
// class _HeaderTab extends StatelessWidget {
//   final String title;
//   final bool selected;
//   const _HeaderTab({required this.title, this.selected = false});
//
//   @override
//   Widget build(BuildContext context) {
//     final textStyle = TextStyle(
//       color: selected ? Colors.white : Colors.white70,
//       fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//       fontSize: 14,
//     );
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Measure the width of the text
//         final textPainter = TextPainter(text: TextSpan(text: title, style: textStyle), textDirection: TextDirection.ltr)..layout();
//
//         final textWidth = textPainter.width;
//
//         return SizedBox(
//           height: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(title, style: textStyle),
//               SizedBox(height: 5),
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 height: 3,
//                 width: selected ? textWidth : 0,
//                 decoration: BoxDecoration(
//                   color: selected ? Theme.of(context).primaryColor : Colors.transparent,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class ItemCard extends StatelessWidget {
//   final String imagePath;
//   final bool isMobile;
//   const ItemCard({super.key, this.isMobile = false, required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     final double cardHeight = isMobile ? 400 : 320; // Adjust as needed
//
//     return SizedBox(
//       height: cardHeight,
//       child: Stack(
//         children: [
//           // Background image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Image.asset(
//               imagePath,
//               width: double.infinity,
//               height: double.infinity,
//               fit: BoxFit.none,
//               alignment: AlignmentDirectional.topCenter,
//             ),
//           ),
//           // Gradient overlay for readability
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: [
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   // Color(0xFF262626).withOpacity(.8),   // Your desired color// Your desired color
//                   Color(0xFF262626).withOpacity(.7), // Your desired color// Your desired color
//                   Color(0xFF262626).withOpacity(.5), // Your desired color// Your desired color
//                   Color(0xFF262626).withOpacity(.1), // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                 ],
//               ),
//             ),
//           ),
//           // Content
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Menu button (top right)
//               Align(alignment: Alignment.topRight, child: IconButton(icon: SvgPicture.asset('assets/more.svg'), onPressed: () {})),
//               const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Status button
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
//                       decoration: BoxDecoration(
//                         color: Color(0xFF201611).withOpacity(.5),
//                         border: Border.all(color: const Color(0xFFC25F30), width: 0.5),
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: const [
//                           Text('Pending Approval', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16)),
//                           SizedBox(width: 6),
//                           Icon(Icons.keyboard_arrow_down, color: Color(0xFFB47B48), size: 20),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     // Title
//                     const Text(
//                       'Item title long title long title long title long title long title long title long title',
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 12),
//                     // Date row
//                     Row(
//                       children: [
//                         SvgPicture.asset('assets/calender.svg'),
//                         SizedBox(width: 8),
//                         Text(
//                           '5 Nights (Jan 16 - Jan 20, 2024)',
//                           style: TextStyle(color: Colors.white54, fontSize: 12),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Container(height: 1, color: const Color(0xFF393939)),
//                     const SizedBox(height: 12),
//                     // Footer
//                     Row(
//                       children: [
//                         // Avatars
//                         SizedBox(
//                           width: 100,
//                           child: Stack(
//                             children: [
//                               const CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/images/human_img1.png')),
//                               Positioned(
//                                 left: 20,
//                                 child: const CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/images/human_img2.png')),
//                               ),
//                               Positioned(
//                                 left: 40,
//                                 child: const CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/images/human_img3.png')),
//                               ),
//                               Positioned(
//                                 left: 60,
//                                 child: Container(
//                                   decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xFF262626), width: 0)),
//                                   child: const CircleAvatar(
//                                     radius: 15,
//                                     backgroundColor: Color(0xFF171717),
//                                     child: Text('+6', style: TextStyle(fontSize: 13, color: Color(0xFFFFC268))),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                         const Text('4 unfinished tasks', style: TextStyle(color: Colors.white54, fontSize: 15)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, context) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             brightness: Brightness.dark,
//             scaffoldBackgroundColor: const Color(0xFF000000),
//             primaryColor: const Color(0xFFFFC268),
//             textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
//           ),
//           home: const MainLayout(),
//         );
//       },
//     );
//   }
// }
//
// class MainLayout extends StatelessWidget {
//   const MainLayout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> imagePaths = [
//       'assets/images/item_cover1.png',
//       'assets/images/item_cover2.png',
//       'assets/images/item_cover3.png',
//       'assets/images/item_cover1.png',
//       'assets/images/item_cover2.png',
//       'assets/images/item_cover3.png',
//       'assets/images/item_cover1.png',
//       'assets/images/item_cover2.png',
//       'assets/images/item_cover3.png',
//     ];
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final isMobile = constraints.maxWidth < 600;
//           if (isMobile) {
//             // MOBILE LAYOUT
//             return Column(
//               children: [
//                 const CustomMobileHeader(),
//                 // Main Content
//                 Expanded(
//                   child: Container(
//                     color: const Color(0xFF000000),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Title
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8, bottom: 16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text('Items', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white)),
//                                 SvgPicture.asset('assets/filter.svg', width: 40),
//                               ],
//                             ),
//                           ),
//                           // Cards (single column)
//                           Expanded(
//                             child: ListView.separated(
//                               padding: EdgeInsets.zero,
//                               itemCount: 8,
//                               separatorBuilder: (context, i) => const SizedBox(height: 20),
//                               itemBuilder: (context, index) => ItemCard(isMobile: true, imagePath: imagePaths[index]),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             // DESKTOP/TABLET LAYOUT (NO SIDEBAR)
//             return Column(
//               children: [
//                 const CustomHeader(),
//                 // Main Content
//                 Expanded(
//                   child: Container(
//                     color: const Color(0xFF000000),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Title
//
//                           // const SizedBox(height: 32),
//                           // Action Row
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             child: Row(
//                               children: [
//                                 const Text('Items', style: TextStyle(fontSize: 32, fontWeight: FontWeight.normal, color: Colors.white)),
//                                 Spacer(),
//                                 // Filter icon
//                                 // Container(
//                                 //   decoration: BoxDecoration(
//                                 //     color: const Color(0xFF232325),
//                                 //     borderRadius: BorderRadius.circular(24),
//                                 //   ),
//                                 //   padding: const EdgeInsets.all(10),
//                                 //   child: const Icon(Icons.filter_alt_outlined, color: Colors.white70, size: 24),
//                                 // ),
//                                 SvgPicture.asset('assets/filter.svg'),
//                                 Container(height: 48, width: 1, margin: const EdgeInsets.symmetric(horizontal: 12), color: Color(0xFF262626)),
//                                 // Add a New Item button
//                                 ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Theme.of(context).primaryColor,
//                                     foregroundColor: Colors.black,
//                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
//                                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//                                     textStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
//                                   ),
//                                   onPressed: () {},
//                                   child: Row(spacing: 8, children: [SvgPicture.asset('assets/add.svg'), const Text('Add a New Item')]),
//                                   // label: const Text('Add a New Item'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           // Responsive Grid of Cards
//                           Expanded(
//                             child: LayoutBuilder(
//                               builder: (context, constraints) {
//                                 // Responsive column count
//                                 int crossAxisCount = 5;
//                                 if (constraints.maxWidth < 1500) crossAxisCount = 4;
//                                 if (constraints.maxWidth < 1200) crossAxisCount = 3;
//                                 if (constraints.maxWidth < 900) crossAxisCount = 2;
//                                 if (constraints.maxWidth < 600) crossAxisCount = 1;
//                                 return GridView.builder(
//                                   padding: EdgeInsets.symmetric(vertical: 24),
//                                   itemCount: 8,
//                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: crossAxisCount,
//                                     crossAxisSpacing: 16,
//                                     mainAxisSpacing: 20,
//                                     childAspectRatio: 243 / 322,
//                                   ),
//                                   itemBuilder: (context, index) => ItemCard(imagePath: imagePaths[index]),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// class CustomMobileHeader extends StatelessWidget {
//   const CustomMobileHeader({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           height: 72,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           decoration: BoxDecoration(
//             color: Colors.black,
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))],
//           ),
//           child: Row(
//             children: [
//               IconButton(icon: SvgPicture.asset('assets/menu.svg'), onPressed: () {}),
//               const SizedBox(width: 8),
//               SvgPicture.asset('assets/logo.svg'),
//               const Spacer(),
//               // Icons
//               Row(
//                 children: [
//                   IconButton(icon: SvgPicture.asset('assets/settings.svg'), onPressed: () {}),
//                   IconButton(icon: SvgPicture.asset('assets/notifications.svg'), onPressed: () {}),
//                 ],
//               ),
//               // Vertical divider between icons and profile
//               Container(height: 24, width: 1, margin: const EdgeInsets.symmetric(horizontal: 12), color: Color(0xFF262626)),
//               // Profile
//               CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/images/human_img1.png')),
//             ],
//           ),
//         ),
//         Container(height: 1.5, color: Color(0xFF262626)),
//       ],
//     );
//   }
// }
//
// class CustomHeader extends StatelessWidget {
//   const CustomHeader({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 76,
//           padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
//           decoration: BoxDecoration(
//             color: Colors.black,
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))],
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Logo
//               SvgPicture.asset('assets/logo.svg'),
//               SizedBox(width: 30),
//               Expanded(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child: SingleChildScrollView(
//                         physics: BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           spacing: 32,
//                           children: [
//                             _HeaderTab(title: 'Items', selected: true),
//                             _HeaderTab(title: 'Pricing'),
//                             _HeaderTab(title: 'Info'),
//                             _HeaderTab(title: 'Tasks'),
//                             _HeaderTab(title: 'Analytics'),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Vertical divider between tabs and icons
//                     Container(height: 24, width: 1, margin: const EdgeInsets.symmetric(horizontal: 24), color: Color(0xFF262626)),
//                     // Actions (settings, notifications)
//                     Row(
//                       spacing: 8,
//                       children: [
//                         IconButton(icon: SvgPicture.asset('assets/settings.svg'), onPressed: () {}),
//                         IconButton(icon: SvgPicture.asset('assets/notifications.svg'), onPressed: () {}),
//                       ],
//                     ),
//                     // Vertical divider between icons and profile
//                     Container(height: 24, width: 1, margin: const EdgeInsets.symmetric(horizontal: 24), color: Color(0xFF262626)),
//                     // Profile
//                     Row(
//                       children: [
//                         CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/images/human_img1.png')),
//                         const SizedBox(width: 10),
//                         Text('John Doe', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
//                         const SizedBox(width: 4),
//                         const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         // Horizontal divider below header
//         Container(height: 1.5, color: Color(0xFF262626)),
//       ],
//     );
//   }
// }
//
// class _HeaderTab extends StatelessWidget {
//   final String title;
//   final bool selected;
//   const _HeaderTab({required this.title, this.selected = false});
//
//   @override
//   Widget build(BuildContext context) {
//     final textStyle = TextStyle(
//       color: selected ? Colors.white : Colors.white70,
//       fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//       fontSize: 14,
//     );
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Measure the width of the text
//         final textPainter = TextPainter(text: TextSpan(text: title, style: textStyle), textDirection: TextDirection.ltr)..layout();
//
//         final textWidth = textPainter.width;
//
//         return SizedBox(
//           height: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(title, style: textStyle),
//               SizedBox(height: 5),
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 height: 3,
//                 width: selected ? textWidth : 0,
//                 decoration: BoxDecoration(
//                   color: selected ? Theme.of(context).primaryColor : Colors.transparent,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class ItemCard extends StatelessWidget {
//   final String imagePath;
//   final bool isMobile;
//   const ItemCard({super.key, this.isMobile = false, required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     final double cardHeight = isMobile ? 400 : 320; // Adjust as needed
//
//     return SizedBox(
//       height: cardHeight,
//       child: Stack(
//         children: [
//           // Background image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Image.asset(
//               imagePath,
//               width: double.infinity,
//               height: double.infinity,
//               fit: BoxFit.none,
//               alignment: AlignmentDirectional.topCenter,
//             ),
//           ),
//           // Gradient overlay for readability
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: [
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   Color(0xFF262626), // Your desired color
//                   // Color(0xFF262626).withOpacity(.8),   // Your desired color// Your desired color
//                   Color(0xFF262626).withOpacity(.7), // Your desired color// Your desired color
//                   Color(0xFF262626).withOpacity(.5), // Your desired color// Your desired color
//                   Color(0xFF262626).withOpacity(.1), // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                   Colors.transparent, // Your desired color// Your desired color
//                 ],
//               ),
//             ),
//           ),
//           // Content
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Menu button (top right)
//               Align(alignment: Alignment.topRight, child: IconButton(icon: SvgPicture.asset('assets/more.svg'), onPressed: () {})),
//               const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Status button
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
//                       decoration: BoxDecoration(
//                         color: Color(0xFF201611).withOpacity(.5),
//                         border: Border.all(color: const Color(0xFFC25F30), width: 0.5),
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: const [
//                           Text('Pending Approval', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16)),
//                           SizedBox(width: 6),
//                           Icon(Icons.keyboard_arrow_down, color: Color(0xFFB47B48), size: 20),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     // Title
//                     const Text(
//                       'Item title long title long title long title long title long title long title long title',
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 12),
//                     // Date row
//                     Row(
//                       children: [
//                         SvgPicture.asset('assets/calender.svg'),
//                         SizedBox(width: 8),
//                         Text(
//                           '5 Nights (Jan 16 - Jan 20, 2024)',
//                           style: TextStyle(color: Colors.white54, fontSize: 12),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Container(height: 1, color: const Color(0xFF393939)),
//                     const SizedBox(height: 12),
//                     // Footer
//                     Row(
//                       children: [
//                         // Avatars
//                         SizedBox(
//                           width: 100,
//                           child: Stack(
//                             children: [
//                               const CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/images/human_img1.png')),
//                               Positioned(
//                                 left: 20,
//                                 child: const CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/images/human_img2.png')),
//                               ),
//                               Positioned(
//                                 left: 40,
//                                 child: const CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/images/human_img3.png')),
//                               ),
//                               Positioned(
//                                 left: 60,
//                                 child: Container(
//                                   decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xFF262626), width: 0)),
//                                   child: const CircleAvatar(
//                                     radius: 15,
//                                     backgroundColor: Color(0xFF171717),
//                                     child: Text('+6', style: TextStyle(fontSize: 13, color: Color(0xFFFFC268))),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                         const Text('4 unfinished tasks', style: TextStyle(color: Colors.white54, fontSize: 15)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
