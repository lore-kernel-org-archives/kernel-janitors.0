From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 23 Jul 2010 16:34:53 +0000
Subject: [PATCH] char: mxser: remove unnesesary NULL check
Message-Id: <1279902893-27006-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Jiri Slaby <jirislaby@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

mxser_transmit_chars(tty, port) is called only from mxser_interrupt().
NULL check is performed in mxser_interrupt() so it is redundant here.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/mxser.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/mxser.c b/drivers/char/mxser.c
index d2692d4..3fc89da 100644
--- a/drivers/char/mxser.c
+++ b/drivers/char/mxser.c
@@ -2193,7 +2193,7 @@ static void mxser_transmit_chars(struct tty_struct *tty, struct mxser_port *port
 	port->mon_data.up_txcnt += (cnt - port->xmit_cnt);
 	port->icount.tx += (cnt - port->xmit_cnt);
 
-	if (port->xmit_cnt < WAKEUP_CHARS && tty)
+	if (port->xmit_cnt < WAKEUP_CHARS)
 		tty_wakeup(tty);
 
 	if (port->xmit_cnt <= 0) {
-- 
1.7.0.4

