From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:47:42 +0000
Subject: [Kernel-janitors] [PATCH] net/3c505: replace schedule_timeout()
Message-Id: <20040726234742.GF1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68848875415233612=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68848875415233612==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/3c505.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/net/3c505.c	2004-07-02 22:11:05.000000000 +0000
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

--===============68848875415233612==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68848875415233612==--
