From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:21:44 +0000
Subject: [KJ] [PATCH] drivers/net/seeq8005.c : Use of the time_before() macro
Message-Id: <42D8B588.7070304@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060408000806010707060406"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060408000806010707060406
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------060408000806010707060406
Content-Type: text/x-patch;
 name="seeq8005.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="seeq8005.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/seeq8005.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/seeq8005.c	2005-07-16 03:55:43.012670760 -0300
@@ -699,7 +699,7 @@
 	int ioaddr = dev->base_addr;
 	int status = inw(SEEQ_STATUS);
 	int transmit_ptr = 0;
-	int tmp;
+	unsigned long tmp;
 
 	if (net_debug>4) {
 		printk("%s: send 0x%04x\n",dev->name,length);
@@ -724,7 +724,8 @@
 	
 	/* drain FIFO */
 	tmp = jiffies;
-	while ( (((status=inw(SEEQ_STATUS)) & SEEQSTAT_FIFO_EMPTY) == 0) && (jiffies - tmp < HZ))
+	while ( (((status=inw(SEEQ_STATUS)) & SEEQSTAT_FIFO_EMPTY) == 0) 
+			&& (time_before(jiffies, tmp + HZ)))
 		mb();
 	
 	/* doit ! */

--------------060408000806010707060406
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060408000806010707060406--
