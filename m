From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Sep 2013 12:29:27 +0000
Subject: [patch v2 -stable] igbvf: integer wrapping bug setting the mtu
Message-Id: <20130913122927.GA31819@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AE90C24D6B3A694183C094C60CF0A2F6026B7332@saturn3.aculab.com>
In-Reply-To: <AE90C24D6B3A694183C094C60CF0A2F6026B7332@saturn3.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, Bruce Allan <bruce.w.allan@intel.com>, Carolyn Wyborny <carolyn.wyborny@intel.com>, Don Skidmore <donald.c.skidmore@intel.com>, Greg Rose <gregory.v.rose@intel.com>, Peter P Waskiewicz Jr <peter.p.waskiewicz.jr@intel.com>, Alex Duyck <alexander.h.duyck@intel.com>, John Ronciak <john.ronciak@intel.com>, Tushar Dave <tushar.n.dave@intel.com>, "David S. Miller" <davem@davemloft.net>, Mitch Williams <mitch.a.williams@intel.com>, Patrick McHardy <kaber@trash.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If new_mtu is very large then "new_mtu + ETH_HLEN + ETH_FCS_LEN" can
wrap and the check on the next line can underflow. This is one of those
bugs which can be triggered by the user if you have namespaces
configured.

Also since this is something the user can trigger then we don't want to
have dev_err() message.

This is a static checker fix and I'm not sure what the impact is.
---
v2: reformat and also remove the dev_err()

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/intel/igbvf/netdev.c b/drivers/net/ethernet/intel/igbvf/netdev.c
index 95d5430..8cb7958 100644
--- a/drivers/net/ethernet/intel/igbvf/netdev.c
+++ b/drivers/net/ethernet/intel/igbvf/netdev.c
@@ -2344,10 +2344,9 @@ static int igbvf_change_mtu(struct net_device *netdev, int new_mtu)
 	struct igbvf_adapter *adapter = netdev_priv(netdev);
 	int max_frame = new_mtu + ETH_HLEN + ETH_FCS_LEN;
 
-	if ((new_mtu < 68) || (max_frame > MAX_JUMBO_FRAME_SIZE)) {
-		dev_err(&adapter->pdev->dev, "Invalid MTU setting\n");
+	if (new_mtu < 68 || new_mtu > INT_MAX - ETH_HLEN - ETH_FCS_LEN ||
+	    max_frame > MAX_JUMBO_FRAME_SIZE)
 		return -EINVAL;
-	}
 
 #define MAX_STD_JUMBO_FRAME_SIZE 9234
 	if (max_frame > MAX_STD_JUMBO_FRAME_SIZE) {
