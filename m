From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:48:45 +0000
Subject: [Kernel-janitors] [PATCH] dvb/ves1x93: replace schedule_timeout()
Message-Id: <20040726174845.GP1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============050450228138090747=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============050450228138090747==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/ves1x93.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/ves1x93.c	2004-07-21 17:11:44.000000000 +0000
@@ -28,6 +28,7 @@
 #include <linux/init.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include "dvb_frontend.h"
 #include "dvb_functions.h"
@@ -253,7 +254,7 @@ static int ves1x93_clr_bit (struct dvb_i
 {
         ves1x93_writereg (i2c, 0, init_1x93_tab[0] & 0xfe);
         ves1x93_writereg (i2c, 0, init_1x93_tab[0]);
-	dvb_delay(5);
+	msleep(5);
 	return 0;
 }
 
@@ -261,7 +262,7 @@ static int ves1x93_init_aquire (struct d
 {
         ves1x93_writereg (i2c, 3, 0x00);
 	ves1x93_writereg (i2c, 3, init_1x93_tab[3]);
-	dvb_delay(5);
+	msleep(5);
 	return 0;
 }
 

--===============050450228138090747==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============050450228138090747==--
