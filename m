From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:00:30 +0000
Subject: [patch -resend] [SCSI] megaraid: remove a spurious IRQ enable
Message-Id: <20120627090030.GC31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neela Syam Kolli <megaraidlinux@lsi.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>

We took this lock with spin_lock() so we should unlock it with
spin_unlock() instead of spin_unlock_irq().  This was introduced in
f2c8dc402b "[SCSI] megaraid_mbox: remove scsi_assign_lock usage".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This was originally sent on Sat, 30 Jul 2011.  I have cleaned up the
commit message a bit and added Christoph to the CC list.

diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/megaraid_mbox.c
index 35bd138..54b1c5b 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -2731,7 +2731,7 @@ megaraid_reset_handler(struct scsi_cmnd *scp)
 	}
 
  out:
-	spin_unlock_irq(&adapter->lock);
+	spin_unlock(&adapter->lock);
 	return rval;
 }
 
