From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Feb 2016 09:37:52 +0000
Subject: [patch] rocker: fix rocker_world_port_obj_vlan_add()
Message-Id: <20160223093752.GA4030@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@resnulli.us>
Cc: Scott Feldman <sfeldma@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We were changing return values and accidentally made
rocker_world_port_obj_vlan_add() into a no-op.

Fixes: fccd84d44912 ('rocker: return -EOPNOTSUPP for undefined world ops')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/rocker/rocker_main.c b/drivers/net/ethernet/rocker/rocker_main.c
index acafbf8..28b775e 100644
--- a/drivers/net/ethernet/rocker/rocker_main.c
+++ b/drivers/net/ethernet/rocker/rocker_main.c
@@ -1598,7 +1598,6 @@ rocker_world_port_obj_vlan_add(struct rocker_port *rocker_port,
 
 	if (!wops->port_obj_vlan_add)
 		return -EOPNOTSUPP;
-		return 0;
 	return wops->port_obj_vlan_add(rocker_port, vlan, trans);
 }
 
