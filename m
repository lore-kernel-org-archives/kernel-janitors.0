From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 12 May 2016 11:12:02 +0000
Subject: [PATCH 2/3] staging: dgnc: remove redundant variable null check
Message-Id: <20160512111202.GA28296@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The unit struct(un_t) was not used in dgnc_tty_hangup().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 52a1613..5119bcb 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1294,15 +1294,9 @@ static int dgnc_block_til_ready(struct tty_struct *tty,
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
2.8.2

