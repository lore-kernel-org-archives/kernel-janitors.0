From: Armin Schindler <armin@melware.de>
Date: Fri, 08 Jun 2007 19:40:25 +0000
Subject: [KJ] Re: [PATCH] [trivial] drivers/isdn/hardware/eicon/message.c:
Message-Id: <Pine.LNX.4.61.0706082053150.30772@phoenix.one.melware.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch replaces an array size calculation in
drivers/isdn/hardware/eicon/message.c that was done using
sizeof with the ARRAY_SIZE macro.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
Acked-by: Armin Schindler <armin@melware.de>
---
diff --git a/drivers/isdn/hardware/eicon/message.c b/drivers/isdn/hardware/eicon/message.c
index ccd35d0..582af66 100644
--- a/drivers/isdn/hardware/eicon/message.c
+++ b/drivers/isdn/hardware/eicon/message.c
@@ -552,7 +552,7 @@ word api_put(APPL   * appl, CAPI_MSG   * msg)
 
   for(j=0;j<MAX_MSG_PARMS+1;j++) msg_parms[j].length = 0;
   for(i=0, ret = _BAD_MSG;
-      i<(sizeof(ftable)/sizeof(struct _ftable));
+      i<ARRAY_SIZE(ftable);
       i++) {
 
     if(ftable[i].command=msg->header.command) {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
