From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Jul 2005 19:22:06 +0000
Subject: [KJ] [PATCH] drivers/net/wan/sdla_fr.c : use of time_after macro
Message-Id: <42D2C6DE.3040004@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090004050502040900060802"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090004050502040900060802
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------090004050502040900060802
Content-Type: text/x-patch;
 name="sdla_fr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sdla_fr.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/wan/sdla_fr.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/wan/sdla_fr.c	2005-07-11 16:18:19.120095296 -0300
@@ -152,6 +152,7 @@
 #include <asm/io.h>		/* for inb(), outb(), etc. */
 #include <linux/time.h>	 	/* for do_gettimeofday */	
 #include <linux/in.h>		/* sockaddr_in */
+#include <linux/jiffies.h>	/* time_after() macro */
 #include <asm/errno.h>
 
 #include <linux/ip.h>
@@ -773,7 +774,7 @@
        	for(;;) {
 		if(card->u.f.update_comms_stats == 0)
 			break;
-                if ((jiffies - timeout) > (1 * HZ)){
+                if (time_after(jiffies, timeout + 1 * HZ)){
     			card->u.f.update_comms_stats = 0;
  			return -EAGAIN;
 		}
@@ -4799,7 +4800,7 @@
 {
 	fr_channel_t *chan = dev->priv;
 	volatile sdla_t *card = chan->card;
-	u32 timeout;
+	unsigned long timeout;
 	fr508_flags_t* flags = card->flags;
 	int reset_critical=0;
 	
@@ -4821,7 +4822,7 @@
 		if(!(card->u.f.timer_int_enabled & TMR_INT_ENABLED_UNCONFIG))
 			break;
 
-             	if ((jiffies - timeout) > (1 * HZ)){
+             	if (time_after(jiffies, timeout + 1 * HZ)){
     			card->u.f.timer_int_enabled &= ~TMR_INT_ENABLED_UNCONFIG;
 			printk(KERN_INFO "%s: Failed to delete DLCI %i\n",
 				card->devname,chan->dlci);

--------------090004050502040900060802
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090004050502040900060802--
