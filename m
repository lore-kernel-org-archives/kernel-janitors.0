From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:47:11 +0000
Subject: [Kernel-janitors] [PATCH] dvb/grundig_29504-491: replace
Message-Id: <20040726174711.GM1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32704899773008478=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726174653.GL1897@us.ibm.com>
In-Reply-To: <20040726174653.GL1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============32704899773008478==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/frontends/grundig_29504-491.c	2004-06-16 05:19:52.000000000 +0000
+++ linux-dev/drivers/media/dvb/frontends/grundig_29504-491.c	2004-07-21 17:11:09.000000000 +0000
@@ -29,6 +29,7 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include "dvb_frontend.h"
 #include "dvb_functions.h"
@@ -231,7 +232,7 @@ static void tda8083_wait_diseqc_fifo (st
 	while (jiffies - start < timeout &&
                !(tda8083_readreg(i2c, 0x02) & 0x80))
 	{
-		dvb_delay(50);
+		msleep(50);
 	};
 }
 

--===============32704899773008478==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32704899773008478==--
