From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 11 Oct 2006 13:06:03 +0000
Subject: [KJ] [PATCH 2/3] drivers/scsi/megaraid.c: Replacing yield() with
Message-Id: <1160571243.19143.322.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>
Cc: James.Bottomley@steeleye.com, kernel Janitors <kernel-janitors@lists.osdl.org>

For this driver cond_resched() seems to be a better
alternative

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/scsi/megaraid.c linux-2.6.19-rc1/drivers/scsi/megaraid.c
--- linux-2.6.19-rc1-orig/drivers/scsi/megaraid.c	2006-10-05 14:00:51.000000000 +0530
+++ linux-2.6.19-rc1/drivers/scsi/megaraid.c	2006-10-11 17:57:02.000000000 +0530
@@ -1755,7 +1755,8 @@ __mega_busywait_mbox (adapter_t *adapter
 	for (counter = 0; counter < 10000; counter++) {
 		if (!mbox->m_in.busy)
 			return 0;
-		udelay(100); yield();
+		udelay(100); 
+		cond_resched();
 	}
 	return -1;		/* give up after 1 second */
 }


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
