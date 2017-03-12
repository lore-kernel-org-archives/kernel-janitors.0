From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Sun, 12 Mar 2017 14:46:53 +0000
Subject: [PATCH 2/3] staging: dgnc: remove useless switch-case statements
Message-Id: <20170312144653.GA24016@jyoun-Latitude-E6530>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160504051326.GA21217@certreview.com>
In-Reply-To: <20160504051326.GA21217@certreview.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The dgnc_tty_send_break() has a switch-case condition for msec.
It is no use except case -1.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index c563ee3..7133d2c 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1786,16 +1786,8 @@ static int dgnc_tty_send_break(struct tty_struct *tty, int msec)
 	if (!bd || bd->magic != DGNC_BOARD_MAGIC)
 		return ret;
 
-	switch (msec) {
-	case -1:
+	if (msec < 0)
 		msec = 0xFFFF;
-		break;
-	case 0:
-		msec = 0;
-		break;
-	default:
-		break;
-	}
 
 	spin_lock_irqsave(&ch->ch_lock, flags);
 
-- 
2.7.4

