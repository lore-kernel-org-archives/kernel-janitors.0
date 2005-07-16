From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:09:27 +0000
Subject: [KJ] [PATCH] drivers/scsi/eata.c : Use of the time_before() macro
Message-Id: <42D8B2A7.4040808@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010404080009080209020009"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010404080009080209020009
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------010404080009080209020009
Content-Type: text/x-patch;
 name="eata.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="eata.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/scsi/eata.c	2005-07-13 17:53:34.000000000 -0300
+++ linux-kj/drivers/scsi/eata.c	2005-07-15 16:21:24.558718384 -0300
@@ -1939,7 +1939,8 @@
 
 static int eata2x_eh_host_reset(struct scsi_cmnd *SCarg)
 {
-	unsigned int i, time, k, c, limit = 0;
+	unsigned int i, k, c, limit = 0;
+	unsigned long time;
 	int arg_done = 0;
 	struct scsi_cmnd *SCpnt;
 	struct Scsi_Host *shost = SCarg->device->host;
@@ -2033,7 +2034,7 @@
 
 	/* FIXME: use a sleep instead */
 	time = jiffies;
-	while ((jiffies - time) < (10 * HZ) && limit++ < 200000)
+	while (time_before(jiffies, time + (10 * HZ)) && limit++ < 200000)
 		udelay(100L);
 
 	spin_lock_irq(shost->host_lock);

--------------010404080009080209020009
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010404080009080209020009--
