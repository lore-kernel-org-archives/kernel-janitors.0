From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 13:16:05 +0000
Subject: [PATCH] chelsio: Fix a typo in a function name
Message-Id: <20190721131605.16603-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It is likely that 'my3216_poll()' should be 'my3126_poll()'. (1 and 2
switched in 3126.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/chelsio/cxgb/my3126.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb/my3126.c b/drivers/net/ethernet/chelsio/cxgb/my3126.c
index 20c09cc4b323..60aa45b375b6 100644
--- a/drivers/net/ethernet/chelsio/cxgb/my3126.c
+++ b/drivers/net/ethernet/chelsio/cxgb/my3126.c
@@ -94,7 +94,7 @@ static int my3126_interrupt_handler(struct cphy *cphy)
 	return cphy_cause_link_change;
 }
 
-static void my3216_poll(struct work_struct *work)
+static void my3126_poll(struct work_struct *work)
 {
 	struct cphy *cphy = container_of(work, struct cphy, phy_update.work);
 
@@ -177,7 +177,7 @@ static struct cphy *my3126_phy_create(struct net_device *dev,
 		return NULL;
 
 	cphy_init(cphy, dev, phy_addr, &my3126_ops, mdio_ops);
-	INIT_DELAYED_WORK(&cphy->phy_update, my3216_poll);
+	INIT_DELAYED_WORK(&cphy->phy_update, my3126_poll);
 	cphy->bmsr = 0;
 
 	return cphy;
-- 
2.20.1
