From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 19 Feb 2004 20:54:53 +0000
Subject: [Kernel-janitors] [PATCH] drivers/atm/nicstar.c MIN/MAX removal
Message-Id: <4035229D.8080600@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040108020106040909070306"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040108020106040909070306
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael


--------------040108020106040909070306
Content-Type: text/plain;
 name="minmax_drivers_atm_nicstar.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_atm_nicstar.patch"

--- linux-2.6.3.org/drivers/atm/nicstar.c	2004-02-18 04:57:19.000000000 +0100
+++ linux-2.6.3.test/drivers/atm/nicstar.c	2004-02-19 21:14:24.000000000 +0100
@@ -112,9 +112,6 @@
 
 /* Macros *********************************************************************/
 
-#define MAX(a,b) ((a) > (b) ? (a) : (b))
-#define MIN(a,b) ((a) < (b) ? (a) : (b))
-
 #define CMD_BUSY(card) (readl((card)->membase + STAT) & NS_STAT_CMDBZ)
 
 #define NS_DELAY mdelay(1)
@@ -2483,7 +2480,7 @@
             for (j = 1; j < NS_SKB(iovb)->iovcnt; j++)
             {
                lb = (struct sk_buff *) iov->iov_base;
-               tocopy = MIN(remaining, iov->iov_len);
+               tocopy = min_t(int, remaining, iov->iov_len);
                memcpy(hb->tail, lb->data, tocopy);
                skb_put(hb, tocopy);
                iov++;

--------------040108020106040909070306
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040108020106040909070306--
