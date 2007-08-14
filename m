From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 14 Aug 2007 00:07:09 +0000
Subject: [KJ] [PATCH] drivers/net/tokenring: Convert to generic boolean
Message-Id: <20070814000543.13576.62289.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mikep@linuxtr.net
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert to generic boolean

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Compile-tested with all(yes|mod|no)config on x86(|_64) & sparc(|64)
Diffed against Linus' git-tree.
Sent 2007-05-01, no replys


diff --git a/drivers/net/tokenring/ibmtr.c b/drivers/net/tokenring/ibmtr.c
index 1e8958e..0c69eaa 100644
--- a/drivers/net/tokenring/ibmtr.c
+++ b/drivers/net/tokenring/ibmtr.c
@@ -116,9 +116,6 @@ in the event that chatty debug messages are desired - jjs 12/30/98 */
 #define ENABLE_PAGING 1		
 #endif
 
-#define FALSE 0
-#define TRUE (!FALSE)
-
 /* changes the output format of driver initialization */
 #define TR_VERBOSE	0
 
@@ -1542,7 +1539,7 @@ static void initial_tok_int(struct net_device *dev)
 	ti->ring_speed = init_status & 0x01 ? 16 : 4;
 	DPRINTK("Initial interrupt : %d Mbps, shared RAM base %08x.\n",
 				ti->ring_speed, (unsigned int)dev->mem_start);
-	ti->auto_speedsave=readb(ti->init_srb+INIT_STATUS_2_OFST)&4?TRUE:FALSE;
+	ti->auto_speedsave = (readb(ti->init_srb+INIT_STATUS_2_OFST) & 4) != 0;
 
         if (ti->open_mode = MANUAL)	wake_up(&ti->wait_for_reset);
 	else				tok_open_adapter((unsigned long)dev);
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
