From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Thu, 07 Sep 2006 01:56:25 +0000
Subject: [KJ] [Patch] fix skb leak in isdn_common.c
Message-Id: <1157594186.22555.9.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day list,

Coverity CID 1356,

There looks to be a small leak in isdn_writebuf_stub() in isdn_common.c,
when copy_from_user() returns an un-copied data length (length != 0).
The below patch should be a minimally invasive fix.

compile tested on allyesconfig


Fix skb leak in isdn_common.c

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
--- drivers/isdn/i4l/isdn_common.c.orig	2006-09-07 10:14:32.000000000 +1000
+++ drivers/isdn/i4l/isdn_common.c	2006-09-07 10:28:39.000000000 +1000
@@ -1967,8 +1967,10 @@ isdn_writebuf_stub(int drvidx, int chan,
 	if (!skb)
 		return -ENOMEM;
 	skb_reserve(skb, hl);
-	if (copy_from_user(skb_put(skb, len), buf, len))
+	if (copy_from_user(skb_put(skb, len), buf, len)) {
+		dev_kfree_skb(skb);
 		return -EFAULT;
+	}
 	ret = dev->drv[drvidx]->interface->writebuf_skb(drvidx, chan, 1, skb);
 	if (ret <= 0)
 		dev_kfree_skb(skb);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
