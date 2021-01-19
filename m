From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Jan 2021 14:48:03 +0000
Subject: [PATCH net] net: dsa: b53: fix an off by one in checking "vlan->vid"
Message-Id: <YAbxI97Dl/pmBy5V@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The > comparison should be >= to prevent accessing one element beyond
the end of the dev->vlans[] array in the caller function, b53_vlan_add().
The "dev->vlans" array is allocated in the b53_switch_init() function
and it has "dev->num_vlans" elements.

Fixes: a2482d2ce349 ("net: dsa: b53: Plug in VLAN support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/dsa/b53/b53_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 288b5a5c3e0d..95c7fa171e35 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1404,7 +1404,7 @@ int b53_vlan_prepare(struct dsa_switch *ds, int port,
 	    !(vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED))
 		return -EINVAL;
 
-	if (vlan->vid_end > dev->num_vlans)
+	if (vlan->vid_end >= dev->num_vlans)
 		return -ERANGE;
 
 	b53_enable_vlan(dev, true, ds->vlan_filtering);
-- 
2.29.2
