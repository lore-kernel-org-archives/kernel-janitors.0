From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 24 Sep 2006 22:49:21 +0000
Subject: [KJ] [Patch] BUG_ON conversion for fs/xfs/
Message-Id: <1159138161.9062.6.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this patch converts two if () BUG(); construct to BUG_ON();
which occupies less space, uses unlikely and is safer when
BUG() is disabled.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-git3/fs/xfs/support/debug.c.orig	2006-09-24 23:20:46.000000000 +0200
+++ linux-2.6.18-git3/fs/xfs/support/debug.c	2006-09-24 23:21:05.000000000 +0200
@@ -53,8 +53,7 @@ cmn_err(register int level, char *fmt, .
 	va_end(ap);
 	spin_unlock_irqrestore(&xfs_err_lock,flags);
 
-	if (level = CE_PANIC)
-		BUG();
+	BUG_ON(level = CE_PANIC);
 }
 
 void
@@ -72,8 +71,7 @@ icmn_err(register int level, char *fmt, 
 		strcat(message, "\n");
 	spin_unlock_irqrestore(&xfs_err_lock,flags);
 	printk("%s%s", err_level[level], message);
-	if (level = CE_PANIC)
-		BUG();
+	BUG_ON(level = CE_PANIC);
 }
 
 void


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
