From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:16:44 +0000
Subject: [PATCH 09/15 RESEND] staging: dgnc: remove redundant null check in
Message-Id: <20160706061644.GA18653@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

the "brd" was already checked for NULL before calling dgnc_do_remap().

the dgnc_do_remap() function was called only
from the dgnc_found_board() and the DGNC_BOARD_MAGIC value
was assigned to "brd->magic" in dgcn_found_board(). So it doesn't
need to check about magic value.

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
index 22257d2..1882ef5 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -599,9 +599,6 @@ static int dgnc_finalize_board_init(struct dgnc_board *brd)
  */
 static void dgnc_do_remap(struct dgnc_board *brd)
 {
-	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
-		return;
-
 	brd->re_map_membase = ioremap(brd->membase, 0x1000);
 }
 
-- 
1.9.1

