From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:45:50 +0000
Subject: [Kernel-janitors] [PATCH] dvb/cx24110: replace schedule_timeout()
Message-Id: <20040726174550.GJ1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9068889719122849=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9068889719122849==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/cx24110.c	2004-06-16 05:18:52.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/cx24110.c	2004-07-21 17:10:51.000000000 +0000
@@ -36,6 +36,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 
 #include "dvb_frontend.h"
 #include "dvb_functions.h"
@@ -247,7 +248,7 @@ static int cx24108_set_tv_freq (struct d
         cx24108_write(i2c,pll);
         cx24110_writereg(i2c,0x56,0x7f);
 
-	dvb_delay(10); /* wait a moment for the tuner pll to lock */
+	msleep(10); /* wait a moment for the tuner pll to lock */
 
 	/* tuner pll lock can be monitored on GPIO pin 4 of cx24110 */
         while (!(cx24110_readreg(i2c,0x66)&0x20)&&i<1000)

--===============9068889719122849==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9068889719122849==--
