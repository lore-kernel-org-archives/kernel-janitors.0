From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:47:34 +0000
Subject: [Kernel-janitors] [PATCH] dvb/stv0299.c: replace schedule_timeout()
Message-Id: <20040726174734.GN1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9209487668199845=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9209487668199845==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/stv0299.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/stv0299.c	2004-07-21 17:10:00.000000000 +0000
@@ -50,6 +50,7 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <asm/div64.h>
 
 #include "dvb_frontend.h"
@@ -712,7 +713,7 @@ static int stv0299_wait_diseqc_fifo (str
 			dprintk ("%s: timeout!!\n", __FUNCTION__);
 			return -ETIMEDOUT;
 		}
-		dvb_delay(10);
+		msleep(10);
 	};
 
 	return 0;
@@ -730,7 +731,7 @@ static int stv0299_wait_diseqc_idle (str
 			dprintk ("%s: timeout!!\n", __FUNCTION__);
 			return -ETIMEDOUT;
 		}
-		dvb_delay(10);
+		msleep(10);
 	};
 
 	return 0;
@@ -1340,7 +1341,7 @@ static int uni0299_attach (struct dvb_i2
 	u8 id;
  
 	stv0299_writereg (i2c, 0x02, 0x34); /* standby off */
-	dvb_delay(200);
+	msleep(200);
 	id = stv0299_readreg (i2c, 0x00);
 
 	dprintk ("%s: id == 0x%02x\n", __FUNCTION__, id);

--===============9209487668199845==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9209487668199845==--
