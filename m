From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 16:54:20 +0000
Subject: [patch 3/4] pxa168_eth: update call to phy_mii_ioctl()
Message-Id: <20100824165420.GJ29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Sanap <ssanap@marvell.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The phy_mii_ioctl() function changed recently.  It now takes a struct
ifreq pointer directly.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/pxa168_eth.c b/drivers/net/pxa168_eth.c
index 302fb48..f324b76 100644
--- a/drivers/net/pxa168_eth.c
+++ b/drivers/net/pxa168_eth.c
@@ -1350,7 +1350,7 @@ static int pxa168_eth_do_ioctl(struct net_device *dev, struct ifreq *ifr,
 {
 	struct pxa168_eth_private *pep = netdev_priv(dev);
 	if (pep->phy != NULL)
-		return phy_mii_ioctl(pep->phy, if_mii(ifr), cmd);
+		return phy_mii_ioctl(pep->phy, ifr, cmd);
 
 	return -EOPNOTSUPP;
 }
