From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 04 May 2016 05:13:26 +0000
Subject: [PATCH 2/3] staging: dgnc: remove useless assigned error value in
Message-Id: <20160504051326.GA21217@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

the result in dgnc_get_mstat() was initialized with -EIO but
there are no use of EIO as a result in this function.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index d85d005..46ca01d 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1979,7 +1979,7 @@ static void dgnc_tty_send_xchar(struct tty_struct *tty, char c)
 static inline int dgnc_get_mstat(struct channel_t *ch)
 {
 	unsigned char mstat;
-	int result = -EIO;
+	int result = 0;
 	unsigned long flags;
 
 	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
@@ -1991,8 +1991,6 @@ static inline int dgnc_get_mstat(struct channel_t *ch)
 
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 
-	result = 0;
-
 	if (mstat & UART_MCR_DTR)
 		result |= TIOCM_DTR;
 	if (mstat & UART_MCR_RTS)
-- 
2.8.2

