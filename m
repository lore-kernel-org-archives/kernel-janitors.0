From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 01 Apr 2016 08:28:22 +0000
Subject: [PATCH 1/2] staging: dgnc: remove too many traverse pointer
Message-Id: <20160401082822.GA17300@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The "ch->ch_bd" is already assined to "bd" but this is only
for checking null or MAGIC number.
in the dgnc_tty_ioctl function, bd can be used for referencing
to board_ops structure.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index d617fca..5d8da41 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -2518,6 +2518,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 			  unsigned long arg)
 {
 	struct dgnc_board *bd;
+	struct board_ops *ch_bd_ops;
 	struct channel_t *ch;
 	struct un_t *un;
 	int rc;
@@ -2539,6 +2540,8 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 	if (!bd || bd->magic != DGNC_BOARD_MAGIC)
 		return -ENODEV;
 
+	ch_bd_ops = bd->bd_ops;
+
 	spin_lock_irqsave(&ch->ch_lock, flags);
 
 	if (un->un_open_count <= 0) {
@@ -2563,7 +2566,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		if (rc)
 			return rc;
 
-		rc = ch->ch_bd->bd_ops->drain(tty, 0);
+		rc = ch_bd_ops->drain(tty, 0);
 
 		if (rc)
 			return -EINTR;
@@ -2571,7 +2574,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		spin_lock_irqsave(&ch->ch_lock, flags);
 
 		if (((cmd = TCSBRK) && (!arg)) || (cmd = TCSBRKP))
-			ch->ch_bd->bd_ops->send_break(ch, 250);
+			ch_bd_ops->send_break(ch, 250);
 
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
 
@@ -2588,13 +2591,13 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		if (rc)
 			return rc;
 
-		rc = ch->ch_bd->bd_ops->drain(tty, 0);
+		rc = ch_bd_ops->drain(tty, 0);
 		if (rc)
 			return -EINTR;
 
 		spin_lock_irqsave(&ch->ch_lock, flags);
 
-		ch->ch_bd->bd_ops->send_break(ch, 250);
+		ch_bd_ops->send_break(ch, 250);
 
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
 
@@ -2606,13 +2609,13 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		if (rc)
 			return rc;
 
-		rc = ch->ch_bd->bd_ops->drain(tty, 0);
+		rc = ch_bd_ops->drain(tty, 0);
 		if (rc)
 			return -EINTR;
 
 		spin_lock_irqsave(&ch->ch_lock, flags);
 
-		ch->ch_bd->bd_ops->send_break(ch, 250);
+		ch_bd_ops->send_break(ch, 250);
 
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
 
@@ -2641,7 +2644,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		spin_lock_irqsave(&ch->ch_lock, flags);
 		tty->termios.c_cflag = ((tty->termios.c_cflag & ~CLOCAL) |
 				       (arg ? CLOCAL : 0));
-		ch->ch_bd->bd_ops->param(tty);
+		ch_bd_ops->param(tty);
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
 
 		return 0;
@@ -2678,7 +2681,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 
 		if ((arg = TCIFLUSH) || (arg = TCIOFLUSH)) {
 			ch->ch_r_head = ch->ch_r_tail;
-			ch->ch_bd->bd_ops->flush_uart_read(ch);
+			ch_bd_ops->flush_uart_read(ch);
 			/* Force queue flow control to be released, if needed */
 			dgnc_check_queue_flow_control(ch);
 		}
@@ -2686,7 +2689,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		if ((arg = TCOFLUSH) || (arg = TCIOFLUSH)) {
 			if (!(un->un_type = DGNC_PRINT)) {
 				ch->ch_w_head = ch->ch_w_tail;
-				ch->ch_bd->bd_ops->flush_uart_write(ch);
+				ch_bd_ops->flush_uart_write(ch);
 
 				if (ch->ch_tun.un_flags & (UN_LOW|UN_EMPTY)) {
 					ch->ch_tun.un_flags &@@ -2720,14 +2723,14 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 			/* flush rx */
 			ch->ch_flags &= ~CH_STOP;
 			ch->ch_r_head = ch->ch_r_tail;
-			ch->ch_bd->bd_ops->flush_uart_read(ch);
+			ch_bd_ops->flush_uart_read(ch);
 			/* Force queue flow control to be released, if needed */
 			dgnc_check_queue_flow_control(ch);
 		}
 
 		/* now wait for all the output to drain */
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		rc = ch->ch_bd->bd_ops->drain(tty, 0);
+		rc = ch_bd_ops->drain(tty, 0);
 		if (rc)
 			return -EINTR;
 
@@ -2737,7 +2740,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 	case TCSETAW:
 
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		rc = ch->ch_bd->bd_ops->drain(tty, 0);
+		rc = ch_bd_ops->drain(tty, 0);
 		if (rc)
 			return -EINTR;
 
@@ -2760,7 +2763,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		/* set information for ditty */
 		if (cmd = (DIGI_SETAW)) {
 			spin_unlock_irqrestore(&ch->ch_lock, flags);
-			rc = ch->ch_bd->bd_ops->drain(tty, 0);
+			rc = ch_bd_ops->drain(tty, 0);
 
 			if (rc)
 				return -EINTR;
@@ -2793,7 +2796,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 			else
 				ch->ch_flags &= ~(CH_LOOPBACK);
 
-			ch->ch_bd->bd_ops->param(tty);
+			ch_bd_ops->param(tty);
 			spin_unlock_irqrestore(&ch->ch_lock, flags);
 			return 0;
 		}
@@ -2813,7 +2816,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 			return rc;
 		spin_lock_irqsave(&ch->ch_lock, flags);
 		dgnc_set_custom_speed(ch, new_rate);
-		ch->ch_bd->bd_ops->param(tty);
+		ch_bd_ops->param(tty);
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
 		return 0;
 	}
@@ -2834,7 +2837,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		if (rc)
 			return rc;
 		spin_lock_irqsave(&ch->ch_lock, flags);
-		ch->ch_bd->bd_ops->send_immediate_char(ch, c);
+		ch_bd_ops->send_immediate_char(ch, c);
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
 		return 0;
 	}
@@ -2922,7 +2925,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		/*
 		 * Is the UART empty? Add that value to whats in our TX queue.
 		 */
-		count = buf.txbuf + ch->ch_bd->bd_ops->get_uart_bytes_left(ch);
+		count = buf.txbuf + ch_bd_ops->get_uart_bytes_left(ch);
 
 		/*
 		 * Figure out how much data the RealPort Server believes should
-- 
1.9.1

