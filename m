From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:15:34 +0000
Subject: [PATCH 07/15 RESEND] staging: dgnc: remove redundant NULL check for brd
Message-Id: <20160706061534.GA18613@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

the "brd" value cannot be NULL in dgnc_finalize_board_init().
Because "brd" as a parameter of this function was already
checked for NULL.

the dgnc_finalize_board_init() as a static function was called
only from dgnc_found_board() function and brd->magic value
was assigned once in dgnc_found_board(). So it doesn't need to
check for DGNC_BOARD_MAGIC value.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: This patch was not merged for a long time, if there is any reason
why this patch could NOT be merged into staging tree, let me know.
There were no comment for this patch.
I cannot understand why this patch have to wait long time to merge.
And I also sent emails to mailing-lists for reminding this patch...
please let me know, what is the problem to merge this patch into staging tree.

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

