From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:13:14 +0000
Subject: [PATCH 04/15 RESEND] staging: dgnc: remove redundant variable null check
Message-Id: <20160706061314.GA18536@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The unit struct(un_t) was not used in dgnc_tty_hangup().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: This patch was not merged for a long time, if there is any reason
why this patch could NOT be merged into staging tree, let me know.
There were no comment for this patch.
I cannot understand why this patch have to wait long time to merge.
And I also sent emails to mailing-lists for reminding this patch...
please let me know, what is the problem to merge this patch into staging tree.

 drivers/staging/dgnc/dgnc_tty.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 1387041..b33b07c 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1289,15 +1289,9 @@ static int dgnc_block_til_ready(struct tty_struct *tty,
  */
 static void dgnc_tty_hangup(struct tty_struct *tty)
 {
-	struct un_t	*un;
-
 	if (!tty || tty->magic != TTY_MAGIC)
 		return;
 
-	un = tty->driver_data;
-	if (!un || un->magic != DGNC_UNIT_MAGIC)
-		return;
-
 	/* flush the transmit queues */
 	dgnc_tty_flush_buffer(tty);
 }
-- 
1.9.1

