From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 20 May 2016 09:51:04 +0000
Subject: [PATCH 1/2] staging: dgnc: remove redundant NULL check for brd
Message-Id: <20160520095104.GA30075@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

the "brd" value cannot be NULL in dgnc_finalize_board_init().
Because "brd" as a parameter of this function was already
checked for NULL.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index af2e835..22257d2 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -579,9 +579,6 @@ static int dgnc_finalize_board_init(struct dgnc_board *brd)
 {
 	int rc = 0;
 
-	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
-		return -ENODEV;
-
 	if (brd->irq) {
 		rc = request_irq(brd->irq, brd->bd_ops->intr,
 				 IRQF_SHARED, "DGNC", brd);
-- 
1.9.1

