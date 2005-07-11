From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Jul 2005 19:08:05 +0000
Subject: [KJ] [PATCH] drivers/net/wan/wanpipe_multppp.c : Use of time_after
Message-Id: <42D2C395.10708@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090304060002060405090902"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090304060002060405090902
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------090304060002060405090902
Content-Type: text/x-patch;
 name="wanpipe_multppp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="wanpipe_multppp.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/wan/wanpipe_multppp.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/wan/wanpipe_multppp.c	2005-07-07 22:51:36.838889944 -0300
@@ -26,6 +26,7 @@
 #include <linux/wanrouter.h>	/* WAN router definitions */
 #include <linux/wanpipe.h>	/* WANPIPE common user API definitions */
 #include <linux/if_arp.h>	/* ARPHRD_* defines */
+#include <linux/jiffies.h>	/* time_after() macro */
 
 #include <linux/in.h>		/* sockaddr_in */
 #include <linux/inet.h>	
@@ -270,9 +271,9 @@
 	   	ready to accept commands.  We expect this to be completed in less
            	than 1 second. */
 
-		timeout = jiffies;
+		timeout = jiffies + 1 * HZ;
 		while (mb->return_code != 'I')	/* Wait 1s for board to initialize */
-			if ((jiffies - timeout) > 1*HZ) break;
+			if (time_after(jiffies, timeout)) break;
 
 		if (mb->return_code != 'I') {
 			printk(KERN_INFO
@@ -493,11 +494,11 @@
 	chdlc_priv_area->timer_int_enabled = TMR_INT_ENABLED_UPDATE;
   
 	/* wait a maximum of 1 second for the statistics to be updated */ 
-        timeout = jiffies;
+        timeout = jiffies + 1 * HZ;
         for(;;) {
 		if(chdlc_priv_area->update_comms_stats == 0)
 			break;
-                if ((jiffies - timeout) > (1 * HZ)){
+                if (time_after(jiffies, timeout)){
     			chdlc_priv_area->update_comms_stats = 0;
  			chdlc_priv_area->timer_int_enabled &=
 				~TMR_INT_ENABLED_UPDATE; 

--------------090304060002060405090902
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090304060002060405090902--
