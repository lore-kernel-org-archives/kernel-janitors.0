From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:45:18 +0000
Subject: [Kernel-janitors] [PATCH] dvb/at76c651: replace schedule_timeout()
Message-Id: <20040726174518.GI1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============050435399758474331=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============050435399758474331==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/at76c651.c	2004-06-16 05:19:52.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/at76c651.c	2004-07-21 17:10:36.000000000 +0000
@@ -28,6 +28,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #if defined(__powerpc__)
 #include <asm/bitops.h>
@@ -103,7 +104,7 @@ static int at76c651_writereg(struct dvb_
 			"(reg == 0x%02x, val == 0x%02x, ret == %i)\n",
 			__FUNCTION__, reg, data, ret);
 
-	dvb_delay(10);
+	msleep(10);
 
 	return (ret != 1) ? -EREMOTEIO : 0;
 

--===============050435399758474331==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============050435399758474331==--
