From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 22 Apr 2004 22:14:45 +0000
Subject: [Kernel-janitors] [PATCH] drivers/scsi/pcmcia MIN/MAX/NUMBER removal
Message-Id: <408843D5.5070505@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090107030708070503080901"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090107030708070503080901
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.6-rc1) removes unnecessary min/max/number macros and 
changes calls to use kernel.h macros instead.

Feedback is always welcome
Michael


--------------090107030708070503080901
Content-Type: text/plain;
 name="minmax_drivers_scsi_pcmcia.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_scsi_pcmcia.patch"

diff -Naur -X dontdiff-osdl linux-2.6.5.org/drivers/scsi/pcmcia/nsp_cs.c linux-2.6.5.new/drivers/scsi/pcmcia/nsp_cs.c
--- linux-2.6.5.org/drivers/scsi/pcmcia/nsp_cs.c	2004-04-04 05:38:22.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/pcmcia/nsp_cs.c	2004-04-22 22:03:57.468330608 +0200
@@ -315,7 +315,7 @@
 	int i;
 
 	/* setup sync data */
-	for ( i = 0; i < NUMBER(data->Sync); i++ ) {
+	for ( i = 0; i < ARRAY_SIZE(data->Sync); i++ ) {
 		data->Sync[i] = tmp_sync;
 	}
 }
@@ -600,7 +600,7 @@
 	unsigned int  base = SCpnt->device->host->io_port;
 	nsp_hw_data  *data = (nsp_hw_data *)SCpnt->device->host->hostdata;
 	char	     *buf  = data->MsgBuffer;
-	int	      len  = MIN(MSGBUF_SIZE, data->MsgLen);
+	int	      len  = min(MSGBUF_SIZE, data->MsgLen);
 	int	      ptr;
 	int	      ret;
 
@@ -774,7 +774,7 @@
 			continue;
 		}
 
-		res = MIN(res, SCpnt->SCp.this_residual);
+		res = min(res, SCpnt->SCp.this_residual);
 
 		switch (data->TransferMode) {
 		case MODE_IO32:
@@ -868,7 +868,7 @@
 			continue;
 		}
 
-		res = MIN(SCpnt->SCp.this_residual, WFIFO_CRIT);
+		res = min(SCpnt->SCp.this_residual, WFIFO_CRIT);
 
 		//nsp_dbg(NSP_DEBUG_DATA_IO, "ptr=0x%p this=0x%x res=0x%x", SCpnt->SCp.ptr, SCpnt->SCp.this_residual, res);
 		switch (data->TransferMode) {
@@ -1490,7 +1490,7 @@
 	spin_unlock_irqrestore(&(data->Lock), flags);
 
 	SPRINTF("SDTR status\n");
-	for(id = 0; id < NUMBER(data->Sync); id++) {
+	for(id = 0; id < ARRAY_SIZE(data->Sync); id++) {
 
 		SPRINTF("id %d: ", id);
 
@@ -1534,7 +1534,7 @@
         }
 
 
-	thislength = MIN(thislength, length);
+	thislength = min(thislength, length);
 	*start = buffer + offset;
 
 	return thislength;
diff -Naur -X dontdiff-osdl linux-2.6.5.org/drivers/scsi/pcmcia/nsp_cs.h linux-2.6.5.new/drivers/scsi/pcmcia/nsp_cs.h
--- linux-2.6.5.org/drivers/scsi/pcmcia/nsp_cs.h	2004-04-04 05:36:57.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/pcmcia/nsp_cs.h	2004-04-22 22:02:53.674028816 +0200
@@ -26,9 +26,7 @@
 /************************************
  * Some useful macros...
  */
-#define NUMBER(arr) ((int) (sizeof(arr) / sizeof(arr[0]))) /* from XtNumber() in /usr/X11R6/include/X11/Intrinsic.h */
 #define BIT(x)      (1L << (x))
-#define MIN(a,b)    ((a) > (b) ? (b) : (a))
 
 /* SCSI initiator must be ID 7 */
 #define NSP_INITIATOR_ID  7

--------------090107030708070503080901
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090107030708070503080901--
