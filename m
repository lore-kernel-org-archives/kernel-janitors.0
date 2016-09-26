From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 26 Sep 2016 00:38:48 +0000
Subject: [PATCH 02/11 RESEND] staging: dgnc: remove useless message buffer
Message-Id: <20160926003848.GA3747@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

There is a temporary message buffer for the boot message
in dgnc_found_board() but the buffer was not used anywhere in
dgnc driver.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: send the whole series again. Because I missed some patches
when the V2 patches sent.

 drivers/staging/dgnc/dgnc_driver.c | 28 ----------------------------
 drivers/staging/dgnc/dgnc_driver.h |  6 ------
 2 files changed, 34 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index b598034..c87b3de 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -324,17 +324,6 @@ static void dgnc_cleanup_board(struct dgnc_board *brd)
 		brd->re_map_membase = NULL;
 	}
 
-	if (brd->msgbuf_head) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&dgnc_global_lock, flags);
-		brd->msgbuf = NULL;
-		dev_dbg(&brd->pdev->dev, "%s\n", brd->msgbuf_head);
-		kfree(brd->msgbuf_head);
-		brd->msgbuf_head = NULL;
-		spin_unlock_irqrestore(&dgnc_global_lock, flags);
-	}
-
 	/* Free all allocated channels structs */
 	for (i = 0; i < MAXPORTS ; i++) {
 		if (brd->channels[i]) {
@@ -362,7 +351,6 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 	unsigned int pci_irq;
 	int i = 0;
 	int rc = 0;
-	unsigned long flags;
 
 	/* get the board structure and prep it */
 	dgnc_board[dgnc_num_boards] = kzalloc(sizeof(*brd), GFP_KERNEL);
@@ -371,15 +359,6 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 	if (!brd)
 		return -ENOMEM;
 
-	/* make a temporary message buffer for the boot messages */
-	brd->msgbuf_head = kcalloc(8192, sizeof(u8), GFP_KERNEL);
-	brd->msgbuf = brd->msgbuf_head;
-
-	if (!brd->msgbuf) {
-		kfree(brd);
-		return -ENOMEM;
-	}
-
 	/* store the info for the board we've found */
 	brd->magic = DGNC_BOARD_MAGIC;
 	brd->boardnum = dgnc_num_boards;
@@ -553,13 +532,6 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 		     brd->bd_ops->tasklet,
 		     (unsigned long)brd);
 
-	spin_lock_irqsave(&dgnc_global_lock, flags);
-	brd->msgbuf = NULL;
-	dev_dbg(&brd->pdev->dev, "%s\n", brd->msgbuf_head);
-	kfree(brd->msgbuf_head);
-	brd->msgbuf_head = NULL;
-	spin_unlock_irqrestore(&dgnc_global_lock, flags);
-
 	wake_up_interruptible(&brd->state_wait);
 
 	return 0;
diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 88d2696..747a100 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -213,12 +213,6 @@ struct dgnc_board {
 					 * as defined by DPA
 					 */
 
-	/*
-	 *	Mgmt data.
-	 */
-	char		*msgbuf_head;
-	char		*msgbuf;
-
 	uint		bd_dividend;	/* Board/UARTs specific dividend */
 
 	struct board_ops *bd_ops;
-- 
1.9.1

