From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 21:53:20 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 32/38] net/slip: replace
Message-Id: <20040924215320.GQ1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95939399612342413=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95939399612342413==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of 
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/slip.c	2004-09-13 17:15:46.000000000 -0700
+++ 2.6.9-rc2/drivers/net/slip.c	2004-09-21 14:11:55.000000000 -0700
@@ -74,6 +74,7 @@
 #include <linux/if_arp.h>
 #include <linux/if_slip.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 #include "slip.h"
 #ifdef CONFIG_INET
 #include <linux/ip.h>
@@ -1391,8 +1392,7 @@ static void __exit slip_exit(void)
 	 */
 	do {
 		if (busy) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ / 10);
+			msleep_interruptible(100);
 		}
 
 		busy = 0;

--===============95939399612342413==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95939399612342413==--
