From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sun, 06 Jul 2008 22:52:38 +0000
Subject: [PATCH][RE-SEND] drivers/isdn/i4l/isdn_common.c fix small resource
Message-Id: <1215384758.11092.23.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: LKML <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@vger.kernel.org>, kkeil@suse.de, isdn4linux@listserv.isdn4linux.de

G'day people,


Coverity CID: 1356 RESOURCE_LEAK


I found a very old patch for this that was Acked but did not get applied
https://lists.linux-foundation.org/pipermail/kernel-janitors/2006-September/016362.html


There looks to be a small leak in isdn_writebuf_stub() in isdn_common.c,
when copy_from_user() returns an un-copied data length (length != 0).
The below patch should be a minimally invasive fix.

﻿﻿﻿Signed-off-by: Darren Jenkins <darrenrjenkins@gmailcom>
Acked-by: Karsten Keil <kkeil@suse.de>

diff --git a/drivers/isdn/i4l/isdn_common.c b/drivers/isdn/i4l/isdn_common.c
index 0f3c66d..8d8c6b7 100644
--- a/drivers/isdn/i4l/isdn_common.c
+++ b/drivers/isdn/i4l/isdn_common.c
@@ -1977,8 +1977,10 @@ isdn_writebuf_stub(int drvidx, int chan, const u_char __user * buf, int len)
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


