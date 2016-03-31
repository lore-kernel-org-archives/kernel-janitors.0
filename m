From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 31 Mar 2016 08:03:59 +0000
Subject: [PATCH 2/2] staging: dgnc: clean up dgnc_input function
Message-Id: <20160331080359.GA27366@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is for fixing checkpatch.pl warning about
"Alignment should match open parenthesis" but if that is
fixed, code line is over 80 characters.
I think "ch->ch_rqueue + tail + i" could be declared once in
the begining of loop.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 5097208..d617fca 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -602,6 +602,8 @@ void dgnc_input(struct channel_t *ch)
 	 * or the amount of data the card actually has pending...
 	 */
 	while (n) {
+		unsigned char *ch_pos = ch->ch_equeue + tail;
+
 		s = ((head >= tail) ? head : RQUEUESIZE) - tail;
 		s = min(s, n);
 
@@ -616,29 +618,20 @@ void dgnc_input(struct channel_t *ch)
 		 */
 		if (I_PARMRK(tp) || I_BRKINT(tp) || I_INPCK(tp)) {
 			for (i = 0; i < s; i++) {
-				if (*(ch->ch_equeue + tail + i) & UART_LSR_BI)
-					tty_insert_flip_char(tp->port,
-						*(ch->ch_rqueue + tail + i),
-						TTY_BREAK);
-				else if (*(ch->ch_equeue + tail + i) &
-						UART_LSR_PE)
-					tty_insert_flip_char(tp->port,
-						*(ch->ch_rqueue + tail + i),
-						TTY_PARITY);
-				else if (*(ch->ch_equeue + tail + i) &
-						UART_LSR_FE)
-					tty_insert_flip_char(tp->port,
-						*(ch->ch_rqueue + tail + i),
-						TTY_FRAME);
-				else
-					tty_insert_flip_char(tp->port,
-						*(ch->ch_rqueue + tail + i),
-						TTY_NORMAL);
+				unsigned char ch = *(ch_pos + i);
+				char flag = TTY_NORMAL;
+
+				if (ch & UART_LSR_BI)
+					flag = TTY_BREAK;
+				else if (ch & UART_LSR_PE)
+					flag = TTY_PARITY;
+				else if (ch & UART_LSR_FE)
+					flag = TTY_FRAME;
+
+				tty_insert_flip_char(tp->port, ch, flag);
 			}
 		} else {
-			tty_insert_flip_string(tp->port,
-					       ch->ch_rqueue + tail,
-					       s);
+			tty_insert_flip_string(tp->port, ch_pos, s);
 		}
 
 		tail += s;
-- 
1.9.1

