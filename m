From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:46:54 +0000
Subject: [Kernel-janitors] [PATCH] dvb/grundig_29504-401: replace
Message-Id: <20040726174653.GL1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39216218879886156=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39216218879886156==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/grundig_29504-401.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/grundig_29504-401.c	2004-07-21 17:11:24.000000000 +0000
@@ -27,6 +27,7 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include "dvb_frontend.h"
 #include "dvb_functions.h"
@@ -546,7 +547,7 @@ int grundig_29504_401_ioctl (struct dvb_
 		res = init (i2c);
 		if ((res == 0) && (state->first)) {
 			state->first = 0;
-			dvb_delay(200);
+			msleep(200);
 		}
 		return res;
 

--===============39216218879886156==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39216218879886156==--
