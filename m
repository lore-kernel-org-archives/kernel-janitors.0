From: Andi Drebes <lists-receive@programmierforen.de>
Date: Tue, 05 Jun 2007 09:37:10 +0000
Subject: [KJ] [PATCH] [trivial] drivers/ide/legacy/hd.c: Array size
Message-Id: <200706051137.11564.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch replaces an array size calculation in drivers/ide/legacy/hd.c
that was done using sizeof with the ARRAY_SIZE macro.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/drivers/ide/legacy/hd.c b/drivers/ide/legacy/hd.c
index 45ed035..661c12f 100644
--- a/drivers/ide/legacy/hd.c
+++ b/drivers/ide/legacy/hd.c
@@ -130,7 +130,7 @@ struct hd_i_struct {
 	
 #ifdef HD_TYPE
 static struct hd_i_struct hd_info[] = { HD_TYPE };
-static int NR_HD = ((sizeof (hd_info))/(sizeof (struct hd_i_struct)));
+static int NR_HD = ARRAY_SIZE(hd_info);
 #else
 static struct hd_i_struct hd_info[MAX_HD];
 static int NR_HD;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
