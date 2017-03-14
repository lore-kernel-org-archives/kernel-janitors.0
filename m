From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 14 Mar 2017 02:07:45 +0000
Subject: [PATCH 2/2 V2] staging: dgnc: remove useless switch-case statements
Message-Id: <20170314020745.GA23033@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The dgnc_tty_send_break() has a switch-case condition for msec.
It is no use except case -1.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: The two patches in previous series are merged into one patch.

 drivers/staging/dgnc/dgnc_tty.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index dc76e9f..854bd1d 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1790,16 +1790,8 @@ static int dgnc_tty_send_break(struct tty_struct *tty, int msec)
 	if (!bd || bd->magic != DGNC_BOARD_MAGIC)
 		return -EIO;
 
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
1.9.1

