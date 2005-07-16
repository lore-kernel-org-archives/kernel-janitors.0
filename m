From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:08:36 +0000
Subject: [KJ] [PATCH] drivers/net/e1000/e1000_ethtool.c : Use of the
Message-Id: <42D8B274.4000000@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000508010306040102000300"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000508010306040102000300
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------000508010306040102000300
Content-Type: text/x-patch;
 name="e1000_ethtool.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="e1000_ethtool.patch"

Use of the time_after() and time_after_eq()  macros, defined at linux/jiffies.h,
which deal with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/e1000/e1000_ethtool.c	2005-07-13 17:52:19.000000000 -0300
+++ linux-kj/drivers/net/e1000/e1000_ethtool.c	2005-07-15 23:51:00.719718560 -0300
@@ -30,6 +30,7 @@
 
 #include "e1000.h"
 
+#include <linux/jiffies.h>
 #include <asm/uaccess.h>
 
 extern char e1000_driver_name[];
@@ -1389,12 +1390,12 @@
 			 * enough time to complete the receives, if it's 
 			 * exceeded, break and error off
 			 */
-		} while (good_cnt < 64 && jiffies < (time + 20));
+		} while (good_cnt < 64 && time_after(jiffies, time + 20));
 		if(good_cnt != 64) {
 			ret_val = 13; /* ret_val is the same as mis-compare */
 			break; 
 		}
-		if(jiffies >= (time + 2)) {
+		if(time_after_eq(jiffies, time + 2)) {
 			ret_val = 14; /* error code for time out error */
 			break;
 		}

--------------000508010306040102000300
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000508010306040102000300--
