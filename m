From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 23 Sep 2016 01:25:02 +0000
Subject: [PATCH 01/11 V2] staging: dgnc: remove redundant initialization for channel array
Message-Id: <20160923012502.GA31785@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The channel array in board_t was initialized in dgnc_found_board()
with NULL. But the channel is going to initialize in dgnc_tty_init()
again. So the channel array doesn't need to set NULL
for initailization in dgnc_found_board().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: The subject line was cut off, I put it completely and update
change log.

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

