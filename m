From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:44:46 +0000
Subject: [Kernel-janitors] [PATCH] dvb/alps_tdmb7: replace
Message-Id: <20040726174446.GH1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21401763707144417=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21401763707144417==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/alps_tdmb7.c	2004-06-16 05:19:01.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/alps_tdmb7.c	2004-07-21 17:10:18.000000000 +0000
@@ -25,6 +25,7 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include "dvb_frontend.h"
 #include "dvb_functions.h"
@@ -159,7 +160,7 @@ static int cx22700_init (struct dvb_i2c_
 	cx22700_writereg (i2c, 0x00, 0x02);   /*  soft reset */
 	cx22700_writereg (i2c, 0x00, 0x00);
 
-	dvb_delay(10);
+	msleep(10);
 	
 	for (i=0; i<sizeof(init_tab); i+=2)
 		cx22700_writereg (i2c, init_tab[i], init_tab[i+1]);

--===============21401763707144417==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21401763707144417==--
