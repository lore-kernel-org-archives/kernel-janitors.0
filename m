From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 21 Sep 2004 21:56:38 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/40] net/3c505: replace
Message-Id: <20040921215638.GE1946@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69667092094065231=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69667092094065231==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/3c505.c	2004-09-13 17:15:46.000000000 -0700
+++ 2.6.9-rc2/drivers/net/3c505.c	2004-09-14 17:07:02.000000000 -0700
@@ -1327,8 +1327,7 @@ static int __init elp_sense(struct net_d
 	if (orig_HSR & DIR) {
 		/* If HCR.DIR is up, we pull it down. HSR.DIR should follow. */
 		outb(0, dev->base_addr + PORT_CONTROL);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(30*HZ/100);
+		msleep(300);
 		if (inb_status(addr) & DIR) {
 			if (elp_debug > 0)
 				printk(notfound_msg, 2);
@@ -1337,8 +1336,7 @@ static int __init elp_sense(struct net_d
 	} else {
 		/* If HCR.DIR is down, we pull it up. HSR.DIR should follow. */
 		outb(DIR, dev->base_addr + PORT_CONTROL);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(30*HZ/100);
+		msleep(300);
 		if (!(inb_status(addr) & DIR)) {
 			if (elp_debug > 0)
 				printk(notfound_msg, 3);

--===============69667092094065231==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69667092094065231==--
