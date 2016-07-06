From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:12:29 +0000
Subject: [PATCH 03/15 RESEND] staging: dgnc: remove redundant local variable for
Message-Id: <20160706061229.GA18517@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The local variable "bd" was not used in dgnc_carrier() function.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: This patch was not merged for a long time, if there is any reason
why this patch could NOT be merged into staging tree, let me know.
There were no comment for this patch.
I cannot understand why this patch have to wait long time to merge.
And I also sent emails to mailing-lists for reminding this patch...
please let me know, what is the problem to merge this patch into staging tree.

 drivers/staging/dgnc/dgnc_tty.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 17ba966..1387041 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -640,19 +640,12 @@ exit_unlock:
  ************************************************************************/
 void dgnc_carrier(struct channel_t *ch)
 {
-	struct dgnc_board *bd;
-
 	int virt_carrier = 0;
 	int phys_carrier = 0;
 
 	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
 		return;
 
-	bd = ch->ch_bd;
-
-	if (!bd || bd->magic != DGNC_BOARD_MAGIC)
-		return;
-
 	if (ch->ch_mistat & UART_MSR_DCD)
 		phys_carrier = 1;
 
-- 
1.9.1

