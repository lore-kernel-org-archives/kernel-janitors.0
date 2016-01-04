From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jan 2016 21:15:45 +0000
Subject: re: phy: micrel: Add ethtool statistics counters
Message-Id: <20160104211545.GA9452@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andrew Lunn,

The patch 2b2427d06426: "phy: micrel: Add ethtool statistics
counters" from Dec 30, 2015, leads to the following static checker
warning:

	drivers/net/phy/micrel.c:609 kszphy_get_stat()
	warn: unsigned 'val' is never less than zero.

drivers/net/phy/micrel.c
   602  static u64 kszphy_get_stat(struct phy_device *phydev, int i)
   603  {
   604          struct kszphy_hw_stat stat = kszphy_hw_stats[i];
   605          struct kszphy_priv *priv = phydev->priv;
   606          u64 val;
   607  
   608          val = phy_read(phydev, stat.reg);
   609          if (val < 0) {
                    ^^^^^^^
Unpossible!

   610                  val = UINT64_MAX;
   611          } else {
   612                  val = val & ((1 << stat.bits) - 1);
   613                  priv->stats[i] += val;
   614                  val = priv->stats[i];
   615          }
   616  
   617          return val;
   618  }

regards,
dan carpenter
