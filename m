From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Wed, 13 Jul 2005 05:43:35 +0000
Subject: [KJ] [PATCH] drivers/net/wan/sdla_ppp.c : Use of time_after macro
Message-Id: <42D4AA07.9070206@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050101070604080906000502"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050101070604080906000502
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------050101070604080906000502
Content-Type: text/x-patch;
 name="sdla_ppp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sdla_ppp.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/wan/sdla_ppp.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/wan/sdla_ppp.c	2005-07-07 22:46:45.547173016 -0300
@@ -101,6 +101,7 @@
 #include <linux/if_arp.h>	/* ARPHRD_* defines */
 #include <asm/byteorder.h>	/* htons(), etc. */
 #include <linux/in.h>		/* sockaddr_in */
+#include <linux/jiffies.h>	/* time_after() macro */
 
 
 #include <asm/uaccess.h>
@@ -482,7 +483,7 @@
 		if(ppp_priv_area->update_comms_stats == 0){
 			break;
 		}
-                if ((jiffies - timeout) > (1 * HZ)){
+                if (time_after(jiffies, timeout + 1 * HZ)){
     			ppp_priv_area->update_comms_stats = 0;
  			ppp_priv_area->timer_int_enabled &=
 				~TMR_INT_ENABLED_UPDATE; 

--------------050101070604080906000502
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050101070604080906000502--
