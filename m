From: Michael Veeck <michael.veeck@gmx.net>
Date: Tue, 06 Apr 2004 23:44:00 +0000
Subject: [Kernel-janitors] [PATCH] clean up  drivers/scsi/pcmcia/nsp_cs
Message-Id: <407340C0.7050401@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070100080906070609070706"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070100080906070609070706
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

This patch (against 2.6.5) removes some unnecessary macros from 
drivers/scsi/pcmcia/nsp_cs.c and .h

One Question: Like MIN/MAX and ARRAY_SIZE, it seems that BIT(x) is also 
  defined a thousand times in the kernel. But which macro should be 
used? Here I included linux/input.h, but I do appreciate feedback on 
which version is the safest.

Best regards
Michael Veeck

--------------070100080906070609070706
Content-Type: text/plain;
 name="minmax_drivers_scsi_pcmcia.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_scsi_pcmcia.patch"

diff -Naur linux-2.6.5.org/drivers/scsi/pcmcia/nsp_cs.c linux-2.6.5.new/drivers/scsi/pcmcia/nsp_cs.c
--- linux-2.6.5.org/drivers/scsi/pcmcia/nsp_cs.c	2004-04-04 05:38:22.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/pcmcia/nsp_cs.c	2004-04-07 00:23:21.901487096 +0200
@@ -31,6 +31,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -315,7 +316,7 @@
 	int i;
 
 	/* setup sync data */
-	for ( i = 0; i < NUMBER(data->Sync); i++ ) {
+	for (i = 0; i < ARRAY_SIZE(data->Sync); i++) {
 		data->Sync[i] = tmp_sync;
 	}
 }
@@ -600,7 +601,7 @@
 	unsigned int  base = SCpnt->device->host->io_port;
 	nsp_hw_data  *data = (nsp_hw_data *)SCpnt->device->host->hostdata;
 	char	     *buf  = data->MsgBuffer;
-	int	      len  = MIN(MSGBUF_SIZE, data->MsgLen);
+	int	      len  = min(MSGBUF_SIZE, data->MsgLen);
 	int	      ptr;
 	int	      ret;
 
@@ -774,7 +775,7 @@
 			continue;
 		}
 
-		res = MIN(res, SCpnt->SCp.this_residual);
+		res = min(res, SCpnt->SCp.this_residual);
 
 		switch (data->TransferMode) {
 		case MODE_IO32:
@@ -868,7 +869,7 @@
 			continue;
 		}
 
-		res = MIN(SCpnt->SCp.this_residual, WFIFO_CRIT);
+		res = min(SCpnt->SCp.this_residual, WFIFO_CRIT);
 
 		//nsp_dbg(NSP_DEBUG_DATA_IO, "ptr=0x%p this=0x%x res=0x%x", SCpnt->SCp.ptr, SCpnt->SCp.this_residual, res);
 		switch (data->TransferMode) {
@@ -1490,7 +1491,7 @@
 	spin_unlock_irqrestore(&(data->Lock), flags);
 
 	SPRINTF("SDTR status\n");
-	for(id = 0; id < NUMBER(data->Sync); id++) {
+	for (id = 0; id < ARRAY_SIZE(data->Sync); id++) {
 
 		SPRINTF("id %d: ", id);
 
@@ -1534,7 +1535,7 @@
         }
 
 
-	thislength = MIN(thislength, length);
+	thislength = min(thislength, length);
 	*start = buffer + offset;
 
 	return thislength;
diff -Naur linux-2.6.5.org/drivers/scsi/pcmcia/nsp_cs.h linux-2.6.5.new/drivers/scsi/pcmcia/nsp_cs.h
--- linux-2.6.5.org/drivers/scsi/pcmcia/nsp_cs.h	2004-04-04 05:36:57.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/pcmcia/nsp_cs.h	2004-04-07 00:22:47.050785208 +0200
@@ -23,13 +23,6 @@
 #define inline
 */
 
-/************************************
- * Some useful macros...
- */
-#define NUMBER(arr) ((int) (sizeof(arr) / sizeof(arr[0]))) /* from XtNumber() in /usr/X11R6/include/X11/Intrinsic.h */
-#define BIT(x)      (1L << (x))
-#define MIN(a,b)    ((a) > (b) ? (b) : (a))
-
 /* SCSI initiator must be ID 7 */
 #define NSP_INITIATOR_ID  7
 

--------------070100080906070609070706
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070100080906070609070706--
