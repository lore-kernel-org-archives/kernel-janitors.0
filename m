From: Domen Puncer <domen@coderock.org>
Date: Sun, 25 Apr 2004 19:12:46 +0000
Subject: [Kernel-janitors] [patch 2.6.5] kill US_FL_(MODE_XLATE|IGNORE_SER)
Message-Id: <20040425191246.GC1394@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77697525824866376=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77697525824866376==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

US_FL_MODE_XLATE and US_FL_IGNORE_SER were defined as 0, so remove them.
Also deleted 0.5k of trailing spaces (some people just love it?!).

If you want split patches just say.


	Domen

						    
diff -ruNX dontdiff c/drivers/usb/storage/unusual_devs.h a/drivers/usb/storage/unusual_devs.h
--- c/drivers/usb/storage/unusual_devs.h	2004-04-04 15:25:53.000000000 +0200
+++ a/drivers/usb/storage/unusual_devs.h	2004-04-25 20:59:24.000000000 +0200
@@ -45,10 +45,10 @@
  *
  */
 
-UNUSUAL_DEV(  0x03ee, 0x0000, 0x0000, 0x0245, 
+UNUSUAL_DEV(  0x03ee, 0x0000, 0x0000, 0x0245,
 		"Mitsumi",
 		"CD-R/RW Drive",
-		US_SC_8020, US_PR_CBI, NULL, 0), 
+		US_SC_8020, US_PR_CBI, NULL, 0),
 
 UNUSUAL_DEV(  0x03ee, 0x6901, 0x0000, 0x0100,
 		"Mitsumi",
@@ -56,21 +56,21 @@
 		US_SC_DEVICE, US_PR_DEVICE, NULL,
 		US_FL_SINGLE_LUN ),
 
-UNUSUAL_DEV(  0x03f0, 0x0107, 0x0200, 0x0200, 
+UNUSUAL_DEV(  0x03f0, 0x0107, 0x0200, 0x0200,
 		"HP",
 		"CD-Writer+",
-		US_SC_8070, US_PR_CB, NULL, 0), 
+		US_SC_8070, US_PR_CB, NULL, 0),
 
 #ifdef CONFIG_USB_STORAGE_HP8200e
-UNUSUAL_DEV(  0x03f0, 0x0207, 0x0001, 0x0001, 
+UNUSUAL_DEV(  0x03f0, 0x0207, 0x0001, 0x0001,
 		"HP",
 		"CD-Writer+ 8200e",
-		US_SC_8070, US_PR_SCM_ATAPI, init_8200e, 0), 
+		US_SC_8070, US_PR_SCM_ATAPI, init_8200e, 0),
 
-UNUSUAL_DEV(  0x03f0, 0x0307, 0x0001, 0x0001, 
+UNUSUAL_DEV(  0x03f0, 0x0307, 0x0001, 0x0001,
 		"HP",
 		"CD-Writer+ CD-4e",
-		US_SC_8070, US_PR_SCM_ATAPI, init_8200e, 0), 
+		US_SC_8070, US_PR_SCM_ATAPI, init_8200e, 0),
 #endif
 
 /* Deduced by Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
@@ -155,7 +155,7 @@
 /* Reported by Kriston Fincher <kriston@airmail.net>
  * Patch submitted by Sean Millichamp <sean@bruenor.org>
  * This is to support the Panasonic PalmCam PV-SD4090
- * This entry is needed because the device reports Sub=ff 
+ * This entry is needed because the device reports Sub=ff
  */
 UNUSUAL_DEV(  0x04da, 0x0901, 0x0100, 0x0200,
 		"Panasonic",
@@ -172,19 +172,19 @@
 /* Most of the following entries were developed with the help of
  * Shuttle/SCM directly.
  */
-UNUSUAL_DEV(  0x04e6, 0x0001, 0x0200, 0x0200, 
+UNUSUAL_DEV(  0x04e6, 0x0001, 0x0200, 0x0200,
 		"Matshita",
 		"LS-120",
 		US_SC_8020, US_PR_CB, NULL, 0),
 
-UNUSUAL_DEV(  0x04e6, 0x0002, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x04e6, 0x0002, 0x0100, 0x0100,
 		"Shuttle",
 		"eUSCSI Bridge",
-		US_SC_DEVICE, US_PR_DEVICE, usb_stor_euscsi_init, 
-		US_FL_SCM_MULT_TARG ), 
+		US_SC_DEVICE, US_PR_DEVICE, usb_stor_euscsi_init,
+		US_FL_SCM_MULT_TARG ),
 
 #ifdef CONFIG_USB_STORAGE_SDDR09
-UNUSUAL_DEV(  0x04e6, 0x0003, 0x0000, 0x9999, 
+UNUSUAL_DEV(  0x04e6, 0x0003, 0x0000, 0x9999,
 		"Sandisk",
 		"ImageMate SDDR09",
 		US_SC_SCSI, US_PR_EUSB_SDDR09, NULL,
@@ -194,45 +194,45 @@
 UNUSUAL_DEV(  0x04e6, 0x0005, 0x0100, 0x0208,
 		"SCM Microsystems",
 		"eUSB SmartMedia / CompactFlash Adapter",
-		US_SC_SCSI, US_PR_DPCM_USB, sddr09_init, 
-		0), 
+		US_SC_SCSI, US_PR_DPCM_USB, sddr09_init,
+		0),
 #endif
 
-UNUSUAL_DEV(  0x04e6, 0x0006, 0x0100, 0x0205, 
+UNUSUAL_DEV(  0x04e6, 0x0006, 0x0100, 0x0205,
 		"Shuttle",
 		"eUSB MMC Adapter",
-		US_SC_SCSI, US_PR_CB, NULL, 
-		US_FL_SINGLE_LUN), 
+		US_SC_SCSI, US_PR_CB, NULL,
+		US_FL_SINGLE_LUN),
 
-UNUSUAL_DEV(  0x04e6, 0x0007, 0x0100, 0x0200, 
+UNUSUAL_DEV(  0x04e6, 0x0007, 0x0100, 0x0200,
 		"Sony",
 		"Hifd",
-		US_SC_SCSI, US_PR_CB, NULL, 
-		US_FL_SINGLE_LUN), 
+		US_SC_SCSI, US_PR_CB, NULL,
+		US_FL_SINGLE_LUN),
 
-UNUSUAL_DEV(  0x04e6, 0x0009, 0x0200, 0x0200, 
+UNUSUAL_DEV(  0x04e6, 0x0009, 0x0200, 0x0200,
 		"Shuttle",
 		"eUSB ATA/ATAPI Adapter",
 		US_SC_8020, US_PR_CB, NULL, 0),
 
-UNUSUAL_DEV(  0x04e6, 0x000a, 0x0200, 0x0200, 
+UNUSUAL_DEV(  0x04e6, 0x000a, 0x0200, 0x0200,
 		"Shuttle",
 		"eUSB CompactFlash Adapter",
 		US_SC_8020, US_PR_CB, NULL, 0),
 
-UNUSUAL_DEV(  0x04e6, 0x000B, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x04e6, 0x000B, 0x0100, 0x0100,
 		"Shuttle",
 		"eUSCSI Bridge",
-		US_SC_SCSI, US_PR_BULK, usb_stor_euscsi_init, 
-		US_FL_SCM_MULT_TARG ), 
+		US_SC_SCSI, US_PR_BULK, usb_stor_euscsi_init,
+		US_FL_SCM_MULT_TARG ),
 
-UNUSUAL_DEV(  0x04e6, 0x000C, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x04e6, 0x000C, 0x0100, 0x0100,
 		"Shuttle",
 		"eUSCSI Bridge",
-		US_SC_SCSI, US_PR_BULK, usb_stor_euscsi_init, 
-		US_FL_SCM_MULT_TARG ), 
+		US_SC_SCSI, US_PR_BULK, usb_stor_euscsi_init,
+		US_FL_SCM_MULT_TARG ),
 
-UNUSUAL_DEV(  0x04e6, 0x0101, 0x0200, 0x0200, 
+UNUSUAL_DEV(  0x04e6, 0x0101, 0x0200, 0x0200,
 		"Shuttle",
 		"CD-RW Device",
 		US_SC_8020, US_PR_CB, NULL, 0),
@@ -244,7 +244,7 @@
 		US_SC_SCSI, US_PR_BULK, usb_stor_euscsi_init,
 		US_FL_SCM_MULT_TARG ),
 
-/* Iomega Clik! Drive 
+/* Iomega Clik! Drive
  * Reported by David Chatenay <dchatenay@hotmail.com>
  * The reason this is needed is not fully known.
  */
@@ -255,22 +255,22 @@
 		US_FL_FIX_INQUIRY ),
 
 /* This entry is needed because the device reports Sub=ff */
-UNUSUAL_DEV(  0x054c, 0x0010, 0x0106, 0x0450, 
+UNUSUAL_DEV(  0x054c, 0x0010, 0x0106, 0x0450,
 		"Sony",
-		"DSC-S30/S70/S75/505V/F505/F707/F717/P8", 
+		"DSC-S30/S70/S75/505V/F505/F707/F717/P8",
 		US_SC_SCSI, US_PR_DEVICE, NULL,
-		US_FL_SINGLE_LUN | US_FL_MODE_XLATE ),
+		US_FL_SINGLE_LUN ),
 
 /* This entry is needed because the device reports Sub=ff */
-UNUSUAL_DEV(  0x054c, 0x0010, 0x0500, 0x0500, 
-               "Sony",
-               "DSC-T1", 
-               US_SC_8070, US_PR_DEVICE, NULL,
-               US_FL_SINGLE_LUN | US_FL_MODE_XLATE ),
+UNUSUAL_DEV(  0x054c, 0x0010, 0x0500, 0x0500,
+		"Sony",
+		"DSC-T1",
+		US_SC_8070, US_PR_DEVICE, NULL,
+		US_FL_SINGLE_LUN ),
 
 
 /* Reported by wim@geeks.nl */
-UNUSUAL_DEV(  0x054c, 0x0025, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x054c, 0x0025, 0x0100, 0x0100,
 		"Sony",
 		"Memorystick NW-MS7",
 		US_SC_UFI, US_PR_CB, NULL,
@@ -284,18 +284,18 @@
 		0 ),
 #endif
 
-UNUSUAL_DEV(  0x054c, 0x002d, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x054c, 0x002d, 0x0100, 0x0100,
 		"Sony",
 		"Memorystick MSAC-US1",
 		US_SC_DEVICE, US_PR_DEVICE, NULL,
 		US_FL_SINGLE_LUN ),
 
 /* Submitted by Klaus Mueller <k.mueller@intershop.de> */
-UNUSUAL_DEV(  0x054c, 0x002e, 0x0106, 0x0310, 
+UNUSUAL_DEV(  0x054c, 0x002e, 0x0106, 0x0310,
 		"Sony",
 		"Handycam",
 		US_SC_SCSI, US_PR_DEVICE, NULL,
-		US_FL_SINGLE_LUN | US_FL_MODE_XLATE),
+		US_FL_SINGLE_LUN ),
 
 UNUSUAL_DEV(  0x054c, 0x0032, 0x0000, 0x9999,
 		"Sony",
@@ -323,13 +323,13 @@
 		US_SC_DEVICE, US_PR_DEVICE, NULL,
 		US_FL_FIX_INQUIRY ),
 		
-UNUSUAL_DEV(  0x057b, 0x0000, 0x0000, 0x0299, 
+UNUSUAL_DEV(  0x057b, 0x0000, 0x0000, 0x0299,
 		"Y-E Data",
 		"Flashbuster-U",
 		US_SC_DEVICE,  US_PR_CB, NULL,
 		US_FL_SINGLE_LUN),
 
-UNUSUAL_DEV(  0x057b, 0x0000, 0x0300, 0x9999, 
+UNUSUAL_DEV(  0x057b, 0x0000, 0x0300, 0x9999,
 		"Y-E Data",
 		"Flashbuster-U",
 		US_SC_DEVICE,  US_PR_DEVICE, NULL,
@@ -341,10 +341,10 @@
 		"Digital Camera EX-20 DSC",
 		US_SC_8070, US_PR_CBI, NULL, 0 ),
 
-UNUSUAL_DEV(  0x059f, 0xa601, 0x0200, 0x0200, 
+UNUSUAL_DEV(  0x059f, 0xa601, 0x0200, 0x0200,
 		"LaCie",
 		"USB Hard Disk",
-		US_SC_RBC, US_PR_CB, NULL, 0 ), 
+		US_SC_RBC, US_PR_CB, NULL, 0 ),
 
 #ifdef CONFIG_USB_STORAGE_ISD200
 UNUSUAL_DEV(  0x05ab, 0x0031, 0x0100, 0x0110,
@@ -377,7 +377,7 @@
 		"Lexar",
 		"Jumpshot USB CF Reader",
 		US_SC_DEVICE, US_PR_JUMPSHOT, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 #endif
 
 /* Reported by Blake Matheny <bmatheny@purdue.edu> */
@@ -398,11 +398,11 @@
 		US_FL_FIX_INQUIRY ),
 
 /* Submitted Alexander Oltu <alexander@all-2.com> */
-UNUSUAL_DEV(  0x05e3, 0x0701, 0x0000, 0xffff, 
-		"", 
+UNUSUAL_DEV(  0x05e3, 0x0701, 0x0000, 0xffff,
+		"",
 		"USB TO IDE",
 		US_SC_DEVICE, US_PR_DEVICE, NULL,
-		US_FL_MODE_XLATE ), 
+		0 ),
 
 /* Reported by Peter Marks <peter.marks@turner.com>
  * Like the SIIG unit above, this unit needs an INQUIRY to ask for exactly
@@ -430,15 +430,15 @@
 		"Vivitar",
 		"Vivicam 35Xx",
 		US_SC_SCSI, US_PR_BULK, NULL,
-		US_FL_FIX_INQUIRY | US_FL_MODE_XLATE),
+		US_FL_FIX_INQUIRY ),
 
-UNUSUAL_DEV(  0x0644, 0x0000, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x0644, 0x0000, 0x0100, 0x0100,
 		"TEAC",
 		"Floppy Drive",
-		US_SC_UFI, US_PR_CB, NULL, 0 ), 
+		US_SC_UFI, US_PR_CB, NULL, 0 ),
 
 #ifdef CONFIG_USB_STORAGE_SDDR09
-UNUSUAL_DEV(  0x066b, 0x0105, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x066b, 0x0105, 0x0100, 0x0100,
 		"Olympus",
 		"Camedia MAUSB-2",
 		US_SC_SCSI, US_PR_EUSB_SDDR09, NULL,
@@ -469,11 +469,11 @@
 
 /* Reported by Miguel A. Fosas <amn3s1a@ono.com> */
 UNUSUAL_DEV(  0x0686, 0x4017, 0x0001, 0x0001,
-                "Minolta",
-                "DIMAGE E223",
-                US_SC_SCSI, US_PR_DEVICE, NULL, 0 ),
+		"Minolta",
+		"DIMAGE E223",
+		US_SC_SCSI, US_PR_DEVICE, NULL, 0 ),
 
-UNUSUAL_DEV(  0x0693, 0x0002, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x0693, 0x0002, 0x0100, 0x0100,
 		"Hagiwara",
 		"FlashGate SmartMedia",
 		US_SC_SCSI, US_PR_BULK, NULL, 0 ),
@@ -481,19 +481,19 @@
 UNUSUAL_DEV(  0x0693, 0x0005, 0x0100, 0x0100,
 		"Hagiwara",
 		"Flashgate",
-		US_SC_SCSI, US_PR_BULK, NULL, 0 ), 
+		US_SC_SCSI, US_PR_BULK, NULL, 0 ),
 
-UNUSUAL_DEV(  0x0781, 0x0001, 0x0200, 0x0200, 
+UNUSUAL_DEV(  0x0781, 0x0001, 0x0200, 0x0200,
 		"Sandisk",
 		"ImageMate SDDR-05a",
 		US_SC_SCSI, US_PR_CB, NULL,
 		US_FL_SINGLE_LUN ),
 
-UNUSUAL_DEV(  0x0781, 0x0002, 0x0009, 0x0009, 
+UNUSUAL_DEV(  0x0781, 0x0002, 0x0009, 0x0009,
 		"Sandisk",
 		"ImageMate SDDR-31",
 		US_SC_DEVICE, US_PR_DEVICE, NULL,
-		US_FL_IGNORE_SER ),
+		0 ),
 
 UNUSUAL_DEV(  0x0781, 0x0100, 0x0100, 0x0100,
 		"Sandisk",
@@ -502,7 +502,7 @@
 		US_FL_SINGLE_LUN ),
 
 #ifdef CONFIG_USB_STORAGE_SDDR09
-UNUSUAL_DEV(  0x0781, 0x0200, 0x0000, 0x9999, 
+UNUSUAL_DEV(  0x0781, 0x0200, 0x0000, 0x9999,
 		"Sandisk",
 		"ImageMate SDDR-09",
 		US_SC_SCSI, US_PR_EUSB_SDDR09, NULL,
@@ -516,17 +516,17 @@
 		US_SC_QIC, US_PR_FREECOM, freecom_init, 0),
 #endif
 
-UNUSUAL_DEV(  0x07af, 0x0004, 0x0100, 0x0133, 
+UNUSUAL_DEV(  0x07af, 0x0004, 0x0100, 0x0133,
 		"Microtech",
 		"USB-SCSI-DB25",
 		US_SC_SCSI, US_PR_BULK, usb_stor_euscsi_init,
-		US_FL_SCM_MULT_TARG ), 
+		US_FL_SCM_MULT_TARG ),
 
-UNUSUAL_DEV(  0x07af, 0x0005, 0x0100, 0x0100, 
+UNUSUAL_DEV(  0x07af, 0x0005, 0x0100, 0x0100,
 		"Microtech",
 		"USB-SCSI-HD50",
 		US_SC_SCSI, US_PR_BULK, usb_stor_euscsi_init,
-		US_FL_SCM_MULT_TARG ), 
+		US_FL_SCM_MULT_TARG ),
 
 #ifdef CONFIG_USB_STORAGE_DPCM
 UNUSUAL_DEV(  0x07af, 0x0006, 0x0100, 0x0100,
@@ -540,7 +540,7 @@
 		"Datafab",
 		"MDCFE-B USB CF Reader",
 		US_SC_SCSI, US_PR_DATAFAB, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 
 	/*
 	 * The following Datafab-based devices may or may not work
@@ -557,31 +557,31 @@
 		"SIIG/Datafab",
 		"SIIG/Datafab Memory Stick+CF Reader/Writer",
 		US_SC_SCSI, US_PR_DATAFAB, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 
 UNUSUAL_DEV( 0x07c4, 0xa003, 0x0000, 0xffff,
 		"Datafab/Unknown",
 		"Datafab-based Reader",
 		US_SC_SCSI, US_PR_DATAFAB, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 
 UNUSUAL_DEV( 0x07c4, 0xa004, 0x0000, 0xffff,
 		"Datafab/Unknown",
 		"Datafab-based Reader",
 		US_SC_SCSI, US_PR_DATAFAB, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 
 UNUSUAL_DEV( 0x07c4, 0xa005, 0x0000, 0xffff,
 		"PNY/Datafab",
 		"PNY/Datafab CF+SM Reader",
 		US_SC_SCSI, US_PR_DATAFAB, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 
 UNUSUAL_DEV( 0x07c4, 0xa006, 0x0000, 0xffff,
 		"Simple Tech/Datafab",
 		"Simple Tech/Datafab CF+SM Reader",
 		US_SC_SCSI, US_PR_DATAFAB, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 #endif
 		
 #ifdef CONFIG_USB_STORAGE_SDDR55
@@ -599,7 +599,7 @@
 		"Datafab Systems, Inc.",
 		"USB to CF + SM Combo (LC1)",
 		US_SC_SCSI, US_PR_DATAFAB, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 #endif
 #ifdef CONFIG_USB_STORAGE_SDDR55
 /* SM part - aeb <Andries.Brouwer@cwi.nl> */
@@ -653,13 +653,13 @@
 		US_FL_FIX_INQUIRY),
 
 /* Aiptek PocketCAM 3Mega
- * Nicolas DUPEUX <nicolas@dupeux.net> 
+ * Nicolas DUPEUX <nicolas@dupeux.net>
  */
 UNUSUAL_DEV(  0x08ca, 0x2011, 0x0000, 0x9999,
 		"AIPTEK",
 		"PocketCAM 3Mega",
 		US_SC_DEVICE, US_PR_DEVICE, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 
 /* Entry needed for flags. Moreover, all devices with this ID use
  * bulk-only transport, but _some_ falsely report Control/Bulk instead.
@@ -670,14 +670,14 @@
 		"Trumpion",
 		"t33520 USB Flash Card Controller",
 		US_SC_DEVICE, US_PR_BULK, NULL,
-		US_FL_MODE_XLATE),
+		0 ),
 
 /* Trumpion Microelectronics MP3 player (felipe_alfaro@linuxmail.org) */
 UNUSUAL_DEV( 0x090a, 0x1200, 0x0000, 0x9999,
 		"Trumpion",
 		"MP3 player",
 		US_SC_RBC, US_PR_BULK, NULL,
-		US_FL_MODE_XLATE),
+		0 ),
 
 /* aeb */
 UNUSUAL_DEV( 0x090c, 0x1132, 0x0000, 0xffff,
@@ -690,7 +690,7 @@
 		"Minds@Work",
 		"Digital Wallet",
  		US_SC_SCSI, US_PR_CB, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 
 UNUSUAL_DEV(  0x0a16, 0x8888, 0x0100, 0x0100,
 		"IBM",
@@ -706,19 +706,19 @@
  * Submitted by James Courtier-Dutton <James@superbug.demon.co.uk>
  */
 UNUSUAL_DEV( 0x0a17, 0x0004, 0x1000, 0x1000,
-                "Pentax",
-                "Optio 2/3/400",
-                US_SC_DEVICE, US_PR_DEVICE, NULL,
-                US_FL_FIX_INQUIRY ),
+		"Pentax",
+		"Optio 2/3/400",
+		US_SC_DEVICE, US_PR_DEVICE, NULL,
+		US_FL_FIX_INQUIRY ),
 
 
 /* Submitted by Per Winkvist <per.winkvist@uk.com> */
 UNUSUAL_DEV( 0x0a17, 0x006, 0x0000, 0xffff,
-                "Pentax",
-                "Optio S/S4",
-                US_SC_DEVICE, US_PR_DEVICE, NULL,
-                US_FL_FIX_INQUIRY ),
-		
+		"Pentax",
+		"Optio S/S4",
+		US_SC_DEVICE, US_PR_DEVICE, NULL,
+		US_FL_FIX_INQUIRY ),
+
 #ifdef CONFIG_USB_STORAGE_ISD200
 UNUSUAL_DEV(  0x0bf6, 0xa001, 0x0100, 0x0110,
 		"ATI",
@@ -781,10 +781,10 @@
 		"CCYU TECHNOLOGY",
 		"EasyDisk Portable Device",
 		US_SC_DEVICE, US_PR_DEVICE, NULL,
-		US_FL_MODE_XLATE ),
+		0 ),
 
 #ifdef CONFIG_USB_STORAGE_SDDR55
-UNUSUAL_DEV(  0x55aa, 0xa103, 0x0000, 0x9999, 
+UNUSUAL_DEV(  0x55aa, 0xa103, 0x0000, 0x9999,
 		"Sandisk",
 		"ImageMate SDDR55",
 		US_SC_SCSI, US_PR_SDDR55, NULL,
diff -ruNX dontdiff c/drivers/usb/storage/usb.h a/drivers/usb/storage/usb.h
--- c/drivers/usb/storage/usb.h	2004-04-04 15:25:53.000000000 +0200
+++ a/drivers/usb/storage/usb.h	2004-04-25 21:00:52.000000000 +0200
@@ -68,8 +68,6 @@
 
 /* Flag definitions: these entries are static */
 #define US_FL_SINGLE_LUN      0x00000001 /* allow access to only LUN 0	    */
-#define US_FL_MODE_XLATE      0          /* [no longer used]                */
-#define US_FL_IGNORE_SER      0		 /* [no longer used]		    */
 #define US_FL_SCM_MULT_TARG   0x00000020 /* supports multiple targets	    */
 #define US_FL_FIX_INQUIRY     0x00000040 /* INQUIRY response needs faking   */
 #define US_FL_FIX_CAPACITY    0x00000080 /* READ CAPACITY response too big  */

--===============77697525824866376==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77697525824866376==--
