From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 11 Mar 2015 14:05:05 +0000
Subject: [PATCH 3/3] Staging: dgnc: Use goto for spinlock release before return
Message-Id: <20150311140505.GA17063@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lidza Louina <lidza.louina@gmail.com>, Mark Hounschell <markh@compro.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

spin_unlock_irqrestore() is called at several
different places before exiting. This patch uses a goto statement
to factorize these calls.

Coccinelle was used to generate this patch.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 48 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 8179342..2dcc51e 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -507,7 +507,7 @@ void dgnc_input(struct channel_t *ch)
 {
 	struct dgnc_board *bd;
 	struct tty_struct *tp;
-	struct tty_ldisc *ld;
+	struct tty_ldisc *ld = NULL;
 	uint	rmask;
 	ushort	head;
 	ushort	tail;
@@ -539,10 +539,8 @@ void dgnc_input(struct channel_t *ch)
 	tail = ch->ch_r_tail & rmask;
 	data_len = (head - tail) & rmask;
 
-	if (data_len = 0) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
-	}
+	if (data_len = 0)
+		goto exit_unlock;
 
 	/*
 	 * If the device is not open, or CREAD is off,
@@ -556,17 +554,14 @@ void dgnc_input(struct channel_t *ch)
 		/* Force queue flow control to be released, if needed */
 		dgnc_check_queue_flow_control(ch);
 
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
+		goto exit_unlock;
 	}
 
 	/*
 	 * If we are throttled, simply don't read any data.
 	 */
-	if (ch->ch_flags & CH_FORCED_STOPI) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
-	}
+	if (ch->ch_flags & CH_FORCED_STOPI)
+		goto exit_unlock;
 
 	flip_len = TTY_FLIPBUF_SIZE;
 
@@ -604,12 +599,8 @@ void dgnc_input(struct channel_t *ch)
 		}
 	}
 
-	if (len <= 0) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		if (ld)
-			tty_ldisc_deref(ld);
-		return;
-	}
+	if (len <= 0)
+		goto exit_unlock;
 
 	/*
 	 * The tty layer in the kernel has changed in 2.6.16+.
@@ -677,6 +668,12 @@ void dgnc_input(struct channel_t *ch)
 
 	if (ld)
 		tty_ldisc_deref(ld);
+	return;
+
+exit_unlock:
+	if (ld)
+		tty_ldisc_deref(ld);
+	spin_unlock_irqrestore(&ch->ch_lock, flags);
 }
 
 
@@ -1773,10 +1770,8 @@ static int dgnc_tty_write(struct tty_struct *tty,
 	/*
 	 * Bail if no space left.
 	 */
-	if (count <= 0) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return 0;
-	}
+	if (count <= 0)
+		goto exit_retry;
 
 	/*
 	 * Output the printer ON string, if we are in terminal mode, but
@@ -1803,10 +1798,8 @@ static int dgnc_tty_write(struct tty_struct *tty,
 	/*
 	 * If there is nothing left to copy, or I can't handle any more data, leave.
 	 */
-	if (count <= 0) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return 0;
-	}
+	if (count <= 0)
+		goto exit_retry;
 
 	if (from_user) {
 
@@ -1892,6 +1885,11 @@ static int dgnc_tty_write(struct tty_struct *tty,
 	}
 
 	return count;
+
+exit_retry:
+
+	spin_unlock_irqrestore(&ch->ch_lock, flags);
+	return 0;
 }
 
 
-- 
1.9.1

