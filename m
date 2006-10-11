From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 11 Oct 2006 13:06:02 +0000
Subject: [KJ] [PATCH 3/3] drivers/scsi/NCR5380.c: Replacing yield() with
Message-Id: <1160571242.19143.320.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>
Cc: James.Bottomley@steeleye.com, kernel Janitors <kernel-janitors@lists.osdl.org>

For this driver schedule_timeout_schedule() seems to be a better
alternative. 

*Please see if the function should be called with 1 jiffy delay or more
is better*

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/scsi/NCR5380.c linux-2.6.19-rc1/drivers/scsi/NCR5380.c
--- linux-2.6.19-rc1-orig/drivers/scsi/NCR5380.c	2006-09-21 10:15:39.000000000 +0530
+++ linux-2.6.19-rc1/drivers/scsi/NCR5380.c	2006-10-11 17:57:02.000000000 +0530
@@ -347,7 +347,7 @@ static int NCR5380_poll_politely(struct 
 		if((r & bit) = val)
 			return 0;
 		if(!in_interrupt())
-			yield();
+			schedule_timeout_interruptible(1);
 		else
 			cpu_relax();
 	}


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
