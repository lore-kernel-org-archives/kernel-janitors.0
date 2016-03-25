From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 25 Mar 2016 02:44:34 +0000
Subject: [PATCH 2/2] staging: dgnc: fix Logical continuations should be on the
Message-Id: <20160325024434.GA24156@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

fix checkpatch.pl warning about 'Logical continuations
should be on the previous line' in dgnc_neo.c file.

I think the 'force' need to check first, because if the 'force' is true,
it doesn't need to call another function call.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_neo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 10b596f..d732e6e 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -359,8 +359,8 @@ static inline void neo_clear_break(struct channel_t *ch, int force)
 
 	/* Turn break off, and unset some variables */
 	if (ch->ch_flags & CH_BREAK_SENDING) {
-		if (time_after_eq(jiffies, ch->ch_stop_sending_break)
-		    || force) {
+		if (force ||
+		    time_after_eq(jiffies, ch->ch_stop_sending_break)) {
 			unsigned char temp = readb(&ch->ch_neo_uart->lcr);
 
 			writeb((temp & ~UART_LCR_SBC), &ch->ch_neo_uart->lcr);
-- 
1.9.1

