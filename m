From: Domen Puncer <domen@coderock.org>
Date: Sun, 15 Aug 2004 17:04:52 +0000
Subject: [Kernel-janitors] Re: 2.6.8.1-kjt1
Message-Id: <20040815170452.GA2578@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49238017166604858=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49238017166604858==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15/08/04 15:55 +0200, maximilian attems wrote:
> msleep-drivers_net_slip.patch

  CC [M]  drivers/net/slip.o
  drivers/net/slip.c: In function `slip_exit':
  drivers/net/slip.c:1394: warning: implicit declaration of function `msleep'


Added include, to fix this:


Original from Nishanth Aravamudan <nacc@us.ibm.com>
Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/slip.c	Sat Aug 14 10:56:36 2004
+++ a/drivers/net/slip.c	Sun Aug 15 18:58:28 2004
@@ -74,6 +74,7 @@
 #include <linux/if_arp.h>
 #include <linux/if_slip.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 #include "slip.h"
 #ifdef CONFIG_INET
 #include <linux/ip.h>
@@ -1390,10 +1391,8 @@ static void __exit slip_exit(void)
 	/* First of all: check for active disciplines and hangup them.
 	 */
 	do {
-		if (busy) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ / 10);
-		}
+		if (busy)
+			msleep(100);
 
 		busy = 0;
 		for (i = 0; i < slip_maxdev; i++) {

--===============49238017166604858==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49238017166604858==--
