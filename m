From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Sun, 12 Mar 2017 14:46:22 +0000
Subject: [PATCH 1/3] staging: dgnc: ch->ch_bd is already assigned to bd variable
Message-Id: <20170312144622.GA23999@jyoun-Latitude-E6530>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The bd variable in dgnc_tty_send_break() is assigned with
ch->ch_bd but it is not used in this function except checking NULL.
The ch->ch_bd could be replaced with bd variable in dgnc_tty_send_break()

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index cde00e3..c563ee3 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1799,7 +1799,7 @@ static int dgnc_tty_send_break(struct tty_struct *tty, int msec)
 
 	spin_lock_irqsave(&ch->ch_lock, flags);
 
-	ch->ch_bd->bd_ops->send_break(ch, msec);
+	bd->bd_ops->send_break(ch, msec);
 
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 
-- 
2.7.4

