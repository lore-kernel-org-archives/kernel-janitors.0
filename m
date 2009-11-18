From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:24:50 +0000
Subject: [PATCH 13/16] drivers/net/adm8211.c: remove exceptional & on function
Message-Id: <Pine.LNX.4.64.0911181924310.20943@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Wu <flamingice@sourmilk.net>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this file, function names are otherwise used as pointers without &.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier f;
@@

f(...) { ... }

@@
identifier r.f;
@@

- &f
+ f
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wireless/adm8211.c      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/adm8211.c b/drivers/net/wireless/adm8211.c
index b80f514..3941001 100644
--- a/drivers/net/wireless/adm8211.c
+++ b/drivers/net/wireless/adm8211.c
@@ -1538,7 +1538,7 @@ static int adm8211_start(struct ieee80211_hw *dev)
 	adm8211_hw_init(dev);
 	adm8211_rf_set_channel(dev, priv->channel);
 
-	retval = request_irq(priv->pdev->irq, &adm8211_interrupt,
+	retval = request_irq(priv->pdev->irq, adm8211_interrupt,
 			     IRQF_SHARED, "adm8211", dev);
 	if (retval) {
 		printk(KERN_ERR "%s: failed to register IRQ handler\n",
