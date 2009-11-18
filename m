From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:25:43 +0000
Subject: [PATCH 15/16] drivers/net/wireless/p54: remove exceptional & on
Message-Id: <Pine.LNX.4.64.0911181925260.20943@ask.diku.dk>
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
 drivers/net/wireless/p54/p54pci.c   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/p54/p54pci.c b/drivers/net/wireless/p54/p54pci.c
index d348c26..a15962a 100644
--- a/drivers/net/wireless/p54/p54pci.c
+++ b/drivers/net/wireless/p54/p54pci.c
@@ -411,7 +411,7 @@ static int p54p_open(struct ieee80211_hw *dev)
 	int err;
 
 	init_completion(&priv->boot_comp);
-	err = request_irq(priv->pdev->irq, &p54p_interrupt,
+	err = request_irq(priv->pdev->irq, p54p_interrupt,
 			  IRQF_SHARED, "p54pci", dev);
 	if (err) {
 		dev_err(&priv->pdev->dev, "failed to register IRQ handler\n");
