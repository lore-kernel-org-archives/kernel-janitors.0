From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Feb 2019 15:35:15 +0000
Subject: [PATCH net] net: dsa: Fix NULL checking in dsa_slave_set_eee()
Message-Id: <20190206153514.GA11033@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This function can't succeed if dp->pl is NULL.  It will Oops inside the
call to return phylink_ethtool_get_eee(dp->pl, e);

Fixes: 1be52e97ed3e ("dsa: slave: eee: Allow ports to use phylink")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/dsa/slave.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 91de3a663226..9384f95e04d5 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -639,7 +639,7 @@ static int dsa_slave_set_eee(struct net_device *dev, struct ethtool_eee *e)
 	int ret;
 
 	/* Port's PHY and MAC both need to be EEE capable */
-	if (!dev->phydev && !dp->pl)
+	if (!dev->phydev || !dp->pl)
 		return -ENODEV;
 
 	if (!ds->ops->set_mac_eee)
@@ -659,7 +659,7 @@ static int dsa_slave_get_eee(struct net_device *dev, struct ethtool_eee *e)
 	int ret;
 
 	/* Port's PHY and MAC both need to be EEE capable */
-	if (!dev->phydev && !dp->pl)
+	if (!dev->phydev || !dp->pl)
 		return -ENODEV;
 
 	if (!ds->ops->get_mac_eee)
-- 
2.17.1
