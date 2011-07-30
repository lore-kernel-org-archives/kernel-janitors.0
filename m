From: Dan Carpenter <error27@gmail.com>
Date: Sat, 30 Jul 2011 08:39:20 +0000
Subject: [patch] [SCSI] megaraid: remove a spurious IRQ enable
Message-Id: <20110730083920.GC5575@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neela Syam Kolli <megaraidlinux@lsi.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, "open list:MEGARAID SCSI DRI..." <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org

This is a static checker fix.  We took this lock with spin_lock()
so we should unlock it with spin_unlock() instead of
spin_unlock_irq().

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Not tested.

diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/megaraid_mbox.c
index ad13363..57782d9 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -2731,7 +2731,7 @@ megaraid_reset_handler(struct scsi_cmnd *scp)
 	}
 
  out:
-	spin_unlock_irq(&adapter->lock);
+	spin_unlock(&adapter->lock);
 	return rval;
 }
 
