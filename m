From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 10 May 2016 06:46:41 +0000
Subject: [PATCH 2/2 RESEND] staging: dgnc: remove useless error value assignment
Message-Id: <20160510064641.GA25675@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "result" variable in dgnc_get_mstat() was initialized with
"-EIO". But if the "ch" is not null, "result" will be set to zero
and if the "ch" is null, dgnc_get_mstat() will return "-ENXIO" as
an error. So "-EIO" error value was useless in dgnc_get_mstat().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: update subject and change log
origin patch : https://lkml.org/lkml/2016/5/4/13

 drivers/staging/dgnc/dgnc_tty.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index cff34d4..30db091 100644
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

