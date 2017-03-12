From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Sun, 12 Mar 2017 14:47:28 +0000
Subject: [PATCH 3/3] staging: dngc: ch->ch_bd is already assigned to bd variable
Message-Id: <20170312144727.GA24031@jyoun-Latitude-E6530>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The bd variable in dgnc_tty_digiseta() is assigned with
ch->ch_bd but it is not used in this function except checking NULL.
The ch->ch_bd could be replaced with bd variable in dgnc_tty_digiseta()

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 7133d2c..b075350 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -2081,7 +2081,7 @@ static int dgnc_tty_digiseta(struct tty_struct *tty,
 	if (ch->ch_digi.digi_offlen > DIGI_PLEN)
 		ch->ch_digi.digi_offlen = DIGI_PLEN;
 
-	ch->ch_bd->bd_ops->param(tty);
+	bd->bd_ops->param(tty);
 
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 
-- 
2.7.4

