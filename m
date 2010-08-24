From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 16:52:46 +0000
Subject: [patch 1/4] pxa168_eth: remove unneeded null check
Message-Id: <20100824165150.GH29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Sanap <ssanap@marvell.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"pep->pd" isn't checked consistently in this function.  For example it's
dereferenced unconditionally on the next line after the end of the if
condition.  This function is only called from pxa168_eth_probe() and
pep->pd is always non-NULL so I removed the check.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/pxa168_eth.c b/drivers/net/pxa168_eth.c
index ecc64d7..857a681 100644
--- a/drivers/net/pxa168_eth.c
+++ b/drivers/net/pxa168_eth.c
@@ -1414,10 +1414,8 @@ static int ethernet_phy_setup(struct net_device *dev)
 {
 	struct pxa168_eth_private *pep = netdev_priv(dev);
 
-	if (pep->pd != NULL) {
-		if (pep->pd->init)
-			pep->pd->init();
-	}
+	if (pep->pd->init)
+		pep->pd->init();
 	pep->phy = phy_scan(pep, pep->pd->phy_addr & 0x1f);
 	if (pep->phy != NULL)
 		phy_init(pep, pep->pd->speed, pep->pd->duplex);
