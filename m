From: Dan Carpenter <error27@gmail.com>
Date: Thu, 01 Apr 2010 15:54:04 +0000
Subject: [patch] cciss: unlock on error path
Message-Id: <20100401155404.GD5265@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Miller <mike.miller@hp.com>
Cc: Jens Axboe <jens.axboe@oracle.com>, "Stephen M. Cameron" <scameron@beardog.cce.hp.com>, Andrew Morton <akpm@linux-foundation.org>, iss_storagedev@hp.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We take the spin_lock again in fail_all_cmds() so we need to unlock
here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This was found by a static checker and I don't have the hardware myself.
Please review carefully.

diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index 9e3af30..eb5ff05 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -3341,6 +3341,7 @@ static irqreturn_t do_cciss_intr(int irq, void *dev_id)
 					printk(KERN_WARNING
 					       "cciss: controller cciss%d failed, stopping.\n",
 					       h->ctlr);
+					spin_unlock_irqrestore(CCISS_LOCK(h->ctlr), flags);
 					fail_all_cmds(h->ctlr);
 					return IRQ_HANDLED;
 				}
