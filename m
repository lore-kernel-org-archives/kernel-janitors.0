From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 11 Oct 2006 13:06:01 +0000
Subject: [KJ] [PATCH 1/3] drivers/scsi/ibmmca.c: Replacing yield() with a
Message-Id: <1160571241.19143.318.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>
Cc: James.Bottomley@steeleye.com, kernel Janitors <kernel-janitors@lists.osdl.org>

In 2.6, the semantics of calling yield() changed from "sleep for a
bit" to "I really don't want to run for a while".  This matches POSIX
better, but there's a lot of drivers still using yield() when they mean
cond_resched(), schedule() or even schedule_timeout().

For this driver cond_resched() seems to be a better
alternative

Tested compile only

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/scsi/ibmmca.c linux-2.6.19-rc1/drivers/scsi/ibmmca.c
--- linux-2.6.19-rc1-orig/drivers/scsi/ibmmca.c	2006-09-21 10:15:39.000000000 +0530
+++ linux-2.6.19-rc1/drivers/scsi/ibmmca.c	2006-10-11 17:57:02.000000000 +0530
@@ -2268,7 +2268,7 @@ static int __ibmmca_host_reset(Scsi_Cmnd
 		if (!(inb(IM_STAT_REG(host_index)) & IM_BUSY))
 			break;
 		spin_unlock_irq(shpnt->host_lock);
-		yield();
+		cond_resched();
 		spin_lock_irq(shpnt->host_lock);
 	}
 	/*write registers and enable system interrupts */


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
