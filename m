From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Apr 2019 17:03:50 +0000
Subject: [PATCH] firestream: fix spelling mistake "tramsitted" -> "transmitted"
Message-Id: <20190418170350.23247-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181125232108.14548-1-colin.king@canonical.com>
In-Reply-To: <20181125232108.14548-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/firestream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/firestream.c b/drivers/atm/firestream.c
index 11e1663bdc4d..b2c06da4f62e 100644
--- a/drivers/atm/firestream.c
+++ b/drivers/atm/firestream.c
@@ -1646,7 +1646,7 @@ static irqreturn_t fs_irq (int irq, void *dev_id)
 	}
 
 	if (status & ISR_TBRQ_W) {
-		fs_dprintk (FS_DEBUG_IRQ, "Data tramsitted!\n");
+		fs_dprintk (FS_DEBUG_IRQ, "Data transmitted!\n");
 		process_txdone_queue (dev, &dev->tx_relq);
 	}
 
-- 
2.20.1
