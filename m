From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:23:39 +0000
Subject: [KJ] [PATCH] drivers/media/dvb/frontends/stv0299.c : Use of the
Message-Id: <42D8B5FB.5060108@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060302020400090007020808"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060302020400090007020808
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------060302020400090007020808
Content-Type: text/x-patch;
 name="stv0299.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="stv0299.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/media/dvb/frontends/stv0299.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/media/dvb/frontends/stv0299.c	2005-07-15 21:36:14.110070088 -0300
@@ -48,6 +48,7 @@
 #include <linux/moduleparam.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/jiffies.h>
 #include <asm/div64.h>
 
 #include "dvb_frontend.h"
@@ -190,7 +191,7 @@
 	dprintk ("%s\n", __FUNCTION__);
 
 	while (stv0299_readreg(state, 0x0a) & 1) {
-		if (jiffies - start > timeout) {
+		if (time_after(jiffies, start + timeout)) {
 			dprintk ("%s: timeout!!\n", __FUNCTION__);
 			return -ETIMEDOUT;
 		}
@@ -207,7 +208,7 @@
 	dprintk ("%s\n", __FUNCTION__);
 
 	while ((stv0299_readreg(state, 0x0a) & 3) != 2 ) {
-		if (jiffies - start > timeout) {
+		if (time_after(jiffies, start + timeout)) {
 			dprintk ("%s: timeout!!\n", __FUNCTION__);
 			return -ETIMEDOUT;
 		}

--------------060302020400090007020808
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060302020400090007020808--
