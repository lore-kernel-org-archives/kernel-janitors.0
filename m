From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 22 Apr 2004 22:15:21 +0000
Subject: [Kernel-janitors] [PATCH] drivers/scsi/nsp MIN/MAX/NUMBER removal
Message-Id: <408843F9.30108@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010806090507020706060100"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010806090507020706060100
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.6-rc1) removes unnecessary min/max/number macros and 
changes calls to use kernel.h macros instead.

Feedback is always welcome
Michael


--------------010806090507020706060100
Content-Type: text/plain;
 name="minmax_drivers_scsi_nsp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_scsi_nsp.patch"

diff -Nau linux-2.6.5.org/drivers/scsi/nsp32.c linux-2.6.5.new/drivers/scsi/nsp32.c
--- linux-2.6.5.org/drivers/scsi/nsp32.c	2004-04-04 05:36:56.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/nsp32.c	2004-04-07 00:25:29.424100712 +0200
@@ -859,7 +859,7 @@
 	 * or current nexus is not existed, unexpected
 	 * reselection is occurred. Send reject message.
 	 */
-	if (newid >= NUMBER(data->lunt) || newlun >= NUMBER(data->lunt[0])) {
+	if (newid >= ARRAY_SIZE(data->lunt) || newlun >= ARRAY_SIZE(data->lunt[0])) {
 		nsp32_msg(KERN_WARNING, "unknown id/lun");
 		return FALSE;
 	} else if(data->lunt[newid][newlun].SCpnt == NULL) {
@@ -1568,7 +1568,7 @@
 
 
 	SPRINTF("SDTR status\n");
-	for(id = 0; id < NUMBER(data->target); id++) {
+	for (id = 0; id < ARRAY_SIZE(data->target); id++) {
 
                 SPRINTF("id %d: ", id);
 
@@ -1610,7 +1610,7 @@
         }
 
 
-	thislength = MIN(thislength, length);
+	thislength = min(thislength, length);
 	*start = buffer + offset;
 
 	return thislength;
@@ -2753,17 +2753,17 @@
 	case CLOCK_4:
 		/* If data->clock is CLOCK_4, then select 40M sync table. */
 		data->synct   = nsp32_sync_table_40M;
-		data->syncnum = NUMBER(nsp32_sync_table_40M);
+		data->syncnum = ARRAY_SIZE(nsp32_sync_table_40M);
 		break;
 	case CLOCK_2:
 		/* If data->clock is CLOCK_2, then select 20M sync table. */
 		data->synct   = nsp32_sync_table_20M;
-		data->syncnum = NUMBER(nsp32_sync_table_20M);
+		data->syncnum = ARRAY_SIZE(nsp32_sync_table_20M);
 		break;
 	case PCICLK:
 		/* If data->clock is PCICLK, then select pci sync table. */
 		data->synct   = nsp32_sync_table_pci;
-		data->syncnum = NUMBER(nsp32_sync_table_pci);
+		data->syncnum = ARRAY_SIZE(nsp32_sync_table_pci);
 		break;
 	default:
 		nsp32_msg(KERN_WARNING,
@@ -2771,7 +2771,7 @@
 		/* Use default value CLOCK_4 */
 		data->clock   = CLOCK_4;
 		data->synct   = nsp32_sync_table_40M;
-		data->syncnum = NUMBER(nsp32_sync_table_40M);
+		data->syncnum = ARRAY_SIZE(nsp32_sync_table_40M);
 	}
 
 	/*
@@ -2805,9 +2805,9 @@
 		goto free_autoparam;
 	}
 
-	for (i = 0; i < NUMBER(data->lunt); i++) {
-		for (j = 0; j < NUMBER(data->lunt[0]); j++) {
-			int offset = i * NUMBER(data->lunt[0]) + j;
+	for (i = 0; i < ARRAY_SIZE(data->lunt); i++) {
+		for (j = 0; j < ARRAY_SIZE(data->lunt[0]); j++) {
+			int offset = i * ARRAY_SIZE(data->lunt[0]) + j;
 			nsp32_lunt tmp = {
 				.SCpnt       = NULL,
 				.save_datp   = 0,
@@ -2825,7 +2825,7 @@
 	/*
 	 * setup target
 	 */
-	for (i = 0; i < NUMBER(data->target); i++) {
+	for (i = 0; i < ARRAY_SIZE(data->target); i++) {
 		nsp32_target *target = &(data->target[i]);
 
 		target->limit_entry  = 0;
@@ -3021,7 +3021,7 @@
 	 * fall back to asynchronous transfer mode
 	 * initialize SDTR negotiation flag
 	 */
-	for (i = 0; i < NUMBER(data->target); i++) {
+	for (i = 0; i < ARRAY_SIZE(data->target); i++) {
 		nsp32_target *target = &data->target[i];
 
 		target->sync_flag = 0;
diff -Nau linux-2.6.5.org/drivers/scsi/nsp32.h linux-2.6.5.new/drivers/scsi/nsp32.h
--- linux-2.6.5.org/drivers/scsi/nsp32.h	2004-04-04 05:36:11.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/nsp32.h	2004-04-07 00:26:09.976935744 +0200
@@ -70,11 +70,7 @@
 /*
  * MACRO
  */
-#define NUMBER(arr) ((int) (sizeof(arr) / sizeof(arr[0])))
 #define BIT(x)      (1UL << (x))
-#ifndef MIN
-# define MIN(a,b)   ((a) > (b) ? (b) : (a))
-#endif
 
 /*
  * BASIC Definitions

--------------010806090507020706060100
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010806090507020706060100--
