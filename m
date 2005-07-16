From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:24:15 +0000
Subject: [KJ] [PATCH] drivers/media/dvb/frontends/tda8083.c : Use of the
Message-Id: <42D8B61F.2050704@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040409080405020206040106"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D8B5FB.5060108@feitoza.com.br>
In-Reply-To: <42D8B5FB.5060108@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040409080405020206040106
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------040409080405020206040106
Content-Type: text/x-patch;
 name="tda8083.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tda8083.patch"

Use of the time_before() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/media/dvb/frontends/tda8083.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/media/dvb/frontends/tda8083.c	2005-07-15 21:41:35.441220328 -0300
@@ -30,6 +30,7 @@
 #include <linux/moduleparam.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/jiffies.h>
 #include "dvb_frontend.h"
 #include "tda8083.h"
 
@@ -172,7 +173,7 @@
 {
 	unsigned long start = jiffies;
 
-	while (jiffies - start < timeout &&
+	while (time_before(jiffies, start + timeout) &&
                !(tda8083_readreg(state, 0x02) & 0x80))
 	{
 		msleep(50);

--------------040409080405020206040106
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040409080405020206040106--
