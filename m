From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Apr 2013 07:44:20 +0000
Subject: [patch -next] net: calxedaxgmac: fix condition in xgmac_set_features()
Message-Id: <20130425074420.GA11880@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Fabio Estevam <fabio.estevam@freescale.com>, Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

The "changed" variable should be a 64 bit type, otherwise it can't store
all the features.  The way the code is now the test for whether
NETIF_F_RXCSUM changed is always false and we return immediately.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/calxeda/xgmac.c b/drivers/net/ethernet/calxeda/xgmac.c
index 791e5ff..4a1f2fa 100644
--- a/drivers/net/ethernet/calxeda/xgmac.c
+++ b/drivers/net/ethernet/calxeda/xgmac.c
@@ -1482,7 +1482,7 @@ static int xgmac_set_features(struct net_device *dev, netdev_features_t features
 	u32 ctrl;
 	struct xgmac_priv *priv = netdev_priv(dev);
 	void __iomem *ioaddr = priv->base;
-	u32 changed = dev->features ^ features;
+	netdev_features_t changed = dev->features ^ features;
 
 	if (!(changed & NETIF_F_RXCSUM))
 		return 0;
