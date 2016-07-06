From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 06 Jul 2016 06:13:55 +0000
Subject: [PATCH 05/15 RESEND] staging: dgnc: removes redundant null check and change
Message-Id: <20160706061355.GA18560@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The dgnc_set_modem_info() used only channel_t variable.
Any other variables were used only for checking NULL.

So fist parameter changed from "tty_struct" to "channel_t" and
useless NULL checks and variables are removed.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: This patch was not merged for a long time, if there is any reason
why this patch could NOT be merged into staging tree, let me know.
There were no comment for this patch.
I cannot understand why this patch have to wait long time to merge.
And I also sent emails to mailing-lists for reminding this patch...
please let me know, what is the problem to merge this patch into staging tree.

 drivers/staging/dgnc/dgnc_tty.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index b33b07c..e4c6c3f 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -100,7 +100,7 @@ static void dgnc_tty_unthrottle(struct tty_struct *tty);
 static void dgnc_tty_flush_chars(struct tty_struct *tty);
 static void dgnc_tty_flush_buffer(struct tty_struct *tty);
 static void dgnc_tty_hangup(struct tty_struct *tty);
-static int dgnc_set_modem_info(struct tty_struct *tty, unsigned int command,
+static int dgnc_set_modem_info(struct channel_t *ch, unsigned int command,
 			       unsigned int __user *value);
 static int dgnc_get_modem_info(struct channel_t *ch,
 			       unsigned int __user *value);
@@ -2008,32 +2008,14 @@ static int dgnc_get_modem_info(struct channel_t *ch,
  *
  * Set modem signals, called by ld.
  */
-static int dgnc_set_modem_info(struct tty_struct *tty,
+static int dgnc_set_modem_info(struct channel_t *ch,
 			       unsigned int command,
 			       unsigned int __user *value)
 {
-	struct dgnc_board *bd;
-	struct channel_t *ch;
-	struct un_t *un;
 	int ret = -ENXIO;
 	unsigned int arg = 0;
 	unsigned long flags;
 
-	if (!tty || tty->magic != TTY_MAGIC)
-		return ret;
-
-	un = tty->driver_data;
-	if (!un || un->magic != DGNC_UNIT_MAGIC)
-		return ret;
-
-	ch = un->un_ch;
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return ret;
-
-	bd = ch->ch_bd;
-	if (!bd || bd->magic != DGNC_BOARD_MAGIC)
-		return ret;
-
 	ret = get_user(arg, value);
 	if (ret)
 		return ret;
@@ -2600,7 +2582,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 	case TIOCMBIC:
 	case TIOCMSET:
 		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return dgnc_set_modem_info(tty, cmd, uarg);
+		return dgnc_set_modem_info(ch, cmd, uarg);
 
 		/*
 		 * Here are any additional ioctl's that we want to implement
-- 
1.9.1

