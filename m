From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 22 Sep 2016 05:20:51 +0000
Subject: [PATCH 01/11] staging: dgnc: remove redundant initialization for
Message-Id: <20160922052051.GA27160@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The channel array in board_t was initialized in dgnc_found_board()
with NULL. But the channel is going to initialize in dgnc_tty_init().
So the channel array doesn't need to set NULL for initailization.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index 01e948c..b598034 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -400,9 +400,6 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 
 	brd->state		= BOARD_FOUND;
 
-	for (i = 0; i < MAXPORTS; i++)
-		brd->channels[i] = NULL;
-
 	/* store which card & revision we have */
 	pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &brd->subvendor);
 	pci_read_config_word(pdev, PCI_SUBSYSTEM_ID, &brd->subdevice);
-- 
1.9.1

