From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 04 May 2016 05:13:04 +0000
Subject: [PATCH 1/3] staging: dgnc: remove redundant NULL check in
Message-Id: <20160504051304.GA20929@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

tty and ch are already checked for NULL
before calling dgnc_block_til_ready().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 2cecdb0..d85d005 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1172,17 +1172,12 @@ static int dgnc_block_til_ready(struct tty_struct *tty,
 				struct channel_t *ch)
 {
 	int retval = 0;
-	struct un_t *un = NULL;
+	struct un_t *un = tty->driver_data;
 	unsigned long flags;
 	uint	old_flags = 0;
 	int	sleep_on_un_flags = 0;
 
-	if (!tty || tty->magic != TTY_MAGIC || !file || !ch ||
-	    ch->magic != DGNC_CHANNEL_MAGIC)
-		return -ENXIO;
-
-	un = tty->driver_data;
-	if (!un || un->magic != DGNC_UNIT_MAGIC)
+	if (!file)
 		return -ENXIO;
 
 	spin_lock_irqsave(&ch->ch_lock, flags);
-- 
2.8.2

