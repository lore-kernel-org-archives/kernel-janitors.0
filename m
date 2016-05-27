From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 27 May 2016 06:52:58 +0000
Subject: [PATCH 1/7] staging: dgnc: remove useless variable 'intr_count'
Message-Id: <20160527065258.GA2945@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The 'intr_count' variable was used only for increasing.
So the 'intr_count' variable is not useful for this driver.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_cls.c    | 2 --
 drivers/staging/dgnc/dgnc_driver.h | 1 -
 drivers/staging/dgnc/dgnc_neo.c    | 2 --
 3 files changed, 5 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index 46c050c..dcb808f 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -760,8 +760,6 @@ static irqreturn_t cls_intr(int irq, void *voidbrd)
 
 	spin_lock_irqsave(&brd->bd_intr_lock, flags);
 
-	brd->intr_count++;
-
 	/*
 	 * Check the board's global interrupt offset to see if we
 	 * we actually do have an interrupt pending for us.
diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 95ec729..7ac33ed 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -183,7 +183,6 @@ struct dgnc_board {
 	uint		nasync;		/* Number of ports on card */
 
 	uint		irq;		/* Interrupt request number */
-	ulong		intr_count;	/* Count of interrupts */
 	ulong		intr_modem;	/* Count of interrupts */
 	ulong		intr_tx;	/* Count of interrupts */
 	ulong		intr_rx;	/* Count of interrupts */
diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index ba57e95..3f8bbb3 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -926,8 +926,6 @@ static irqreturn_t neo_intr(int irq, void *voidbrd)
 	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
 		return IRQ_NONE;
 
-	brd->intr_count++;
-
 	/* Lock out the slow poller from running on this board. */
 	spin_lock_irqsave(&brd->bd_intr_lock, flags);
 
-- 
1.9.1

