From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 11 Jan 2005 00:42:42 +0000
Subject: [KJ] [UPDATE PATCH] net/slip: replace schedule_timeout() with
Message-Id: <20050111004242.GK9186@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69162060870294528=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============69162060870294528==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> msleep_interruptible-drivers_net_slip.patch

Please consider replacing with the following:

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays as expected. While the original code does use
TASK_INTERRUPTIBLE, it does not check for signals, so I believe msleep() is more
appropriate.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-v/drivers/net/slip.c	2004-12-24 13:35:49.000000000 -0800
+++ 2.6.10/drivers/net/slip.c	2005-01-05 14:23:05.000000000 -0800
@@ -75,6 +75,7 @@
 #include <linux/if_arp.h>
 #include <linux/if_slip.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 #include "slip.h"
 #ifdef CONFIG_INET
 #include <linux/ip.h>
@@ -1395,10 +1396,8 @@ static void __exit slip_exit(void)
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

--===============69162060870294528==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69162060870294528==--
