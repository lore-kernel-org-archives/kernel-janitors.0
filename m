From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 26 Sep 2016 00:42:02 +0000
Subject: [PATCH 04/11] staging: dgnc: kfree for board structure in dgnc_found_board()
Message-Id: <20160926004202.GA3820@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160922052203.GA27209@SEL-JYOUN-D1>
In-Reply-To: <20160922052203.GA27209@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The board structure should be freed when any function was failed
in dgnc_found_board(). And the board strucure will be stored
into dgnc_board array when the dgnc_found_board() function has no error.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: send the whole series again. Because I missed some patches
when the V2 patches sent.

V2: The subject line was cut off, I put it completely and update
change log.

 drivers/staging/dgnc/dgnc_driver.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index 58cebf4..0114e78 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -353,9 +353,7 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 	int rc = 0;
 
 	/* get the board structure and prep it */
-	dgnc_board[dgnc_num_boards] = kzalloc(sizeof(*brd), GFP_KERNEL);
-	brd = dgnc_board[dgnc_num_boards];
-
+	brd = kzalloc(sizeof(*brd), GFP_KERNEL);
 	if (!brd)
 		return -ENOMEM;
 
@@ -411,7 +409,8 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 		if (!brd->membase) {
 			dev_err(&brd->pdev->dev,
 				"Card has no PCI IO resources, failing.\n");
-			return -ENODEV;
+			rc = -ENODEV;
+			goto failed;
 		}
 
 		brd->membase_end = pci_resource_end(pdev, 4);
@@ -502,7 +501,8 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 	default:
 		dev_err(&brd->pdev->dev,
 			"Didn't find any compatible Neo/Classic PCI boards.\n");
-		return -ENXIO;
+		rc = -ENXIO;
+		goto failed;
 	}
 
 	/*
@@ -539,14 +539,15 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 
 	wake_up_interruptible(&brd->state_wait);
 
+	dgnc_board[dgnc_num_boards] = brd;
+
 	return 0;
 
 failed:
 	dgnc_tty_uninit(brd);
-	brd->state = BOARD_FAILED;
-	brd->dpastatus = BD_NOFEP;
+	kfree(brd);
 
-	return -ENXIO;
+	return rc;
 }
 
 static int dgnc_finalize_board_init(struct dgnc_board *brd)
-- 
1.9.1

