From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 12 Dec 2016 11:21:34 +0000
Subject: [patch net-next] irda: w83977af_ir: cleanup an indent issue
Message-Id: <20161212112134.GA10035@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel@sortiz.org>, Joe Perches <joe@perches.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In commit 99d8d2159d7c ("irda: w83977af_ir: Neaten logging"), we
accidentally added an extra tab to these lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/irda/w83977af_ir.c b/drivers/net/irda/w83977af_ir.c
index f293d33fb28f..8d5b903d1d9d 100644
--- a/drivers/net/irda/w83977af_ir.c
+++ b/drivers/net/irda/w83977af_ir.c
@@ -517,9 +517,9 @@ static netdev_tx_t w83977af_hard_xmit(struct sk_buff *skb,
 
 		mtt = irda_get_mtt(skb);
 		pr_debug("%s: %ld, mtt=%d\n", __func__, jiffies, mtt);
-			if (mtt > 1000)
-				mdelay(mtt / 1000);
-			else if (mtt)
+		if (mtt > 1000)
+			mdelay(mtt / 1000);
+		else if (mtt)
 			udelay(mtt);
 
 		/* Enable DMA interrupt */
