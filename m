From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:10:09 +0000
Subject: [KJ] [PATCH] drivers/net/eexpress.c : Use of the time_after() and
Message-Id: <42D8B2D1.7060005@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080408030302060505090705"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080408030302060505090705
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------080408030302060505090705
Content-Type: text/x-patch;
 name="eexpress.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="eexpress.patch"

Use of the time_after() and time_before() macros, defined at linux/jiffies.h,
which deal with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/eexpress.c	2005-07-13 17:52:19.000000000 -0300
+++ linux-kj/drivers/net/eexpress.c	2005-07-15 23:55:32.538395840 -0300
@@ -557,7 +557,7 @@
 
 	if (lp->started)
 	{
-		if ((jiffies - dev->trans_start)>50)
+		if (time_after(jiffies, dev->trans_start + 50))
 		{
 			if (lp->tx_link==lp->last_tx_restart)
 			{
@@ -613,7 +613,7 @@
 	}
 	else
 	{
-		if ((jiffies-lp->init_time)>10)
+		if (time_after(jiffies, lp->init_time + 10))
 		{
 			unsigned short status = scb_status(dev);
 			printk(KERN_WARNING "%s: i82586 startup timed out, status %04x, resetting...\n",
@@ -785,7 +785,7 @@
 static void eexp_cmd_clear(struct net_device *dev)
 {
 	unsigned long int oldtime = jiffies;
-	while (scb_rdcmd(dev) && ((jiffies-oldtime)<10));
+	while (scb_rdcmd(dev) && (time_before(jiffies, oldtime + 10)));
 	if (scb_rdcmd(dev)) {
 		printk("%s: command didn't clear\n", dev->name);
 	}
@@ -1666,7 +1666,7 @@
 #endif
                 oj = jiffies;
                 while ((SCB_CUstat(scb_status(dev)) == 2) &&
-                       ((jiffies-oj) < 2000));
+                       (time_before(jiffies, oj + 2000)));
 		if (SCB_CUstat(scb_status(dev)) == 2)
 			printk("%s: warning, CU didn't stop\n", dev->name);
                 lp->started &= ~(STARTED_CU);

--------------080408030302060505090705
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080408030302060505090705--
