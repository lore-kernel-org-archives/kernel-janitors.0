From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 14 Mar 2017 02:05:32 +0000
Subject: [PATCH 1/2 V2] staging: dgnc: ch->ch_bd is already assigned to bd variable
Message-Id: <20170314020503.GA22933@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The bd variables in functions are already assigned from
ch->ch_bd but it is not used in those functions except checking NULL.

The ch->ch_bd could be replaced with bd variable.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: Patches in previous series are splited but it could be merged into one.
There are lines to replace ch->ch_bd with bd variable.

 drivers/staging/dgnc/dgnc_tty.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 1861bd5..dc76e9f 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1756,7 +1756,7 @@ static int dgnc_tty_tiocmset(struct tty_struct *tty,
 	if (clear & TIOCM_DTR)
 		ch->ch_mostat &= ~(UART_MCR_DTR);
 
-	ch->ch_bd->bd_ops->assert_modem_signals(ch);
+	bd->bd_ops->assert_modem_signals(ch);
 
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 
@@ -1803,7 +1803,7 @@ static int dgnc_tty_send_break(struct tty_struct *tty, int msec)
 
 	spin_lock_irqsave(&ch->ch_lock, flags);
 
-	ch->ch_bd->bd_ops->send_break(ch, msec);
+	bd->bd_ops->send_break(ch, msec);
 
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 
@@ -2095,7 +2095,7 @@ static int dgnc_tty_digiseta(struct tty_struct *tty,
 	if (ch->ch_digi.digi_offlen > DIGI_PLEN)
 		ch->ch_digi.digi_offlen = DIGI_PLEN;
 
-	ch->ch_bd->bd_ops->param(tty);
+	bd->bd_ops->param(tty);
 
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 
@@ -2136,7 +2136,7 @@ static void dgnc_tty_set_termios(struct tty_struct *tty,
 	ch->ch_startc = tty->termios.c_cc[VSTART];
 	ch->ch_stopc  = tty->termios.c_cc[VSTOP];
 
-	ch->ch_bd->bd_ops->param(tty);
+	bd->bd_ops->param(tty);
 	dgnc_carrier(ch);
 
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
-- 
1.9.1

