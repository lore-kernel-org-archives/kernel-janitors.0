From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Mar 2018 23:51:57 +0000
Subject: [PATCH] net: qualcomm: rmnet: check for null ep to avoid null pointer dereference
Message-Id: <20180323235157.8129-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to rmnet_get_endpoint can potentially return NULL so check
for this to avoid any subsequent null pointer dereferences on a NULL
ep.

Detected by CoverityScan, CID#1465385 ("Dereference null return value")

Fixes: 23790ef12082 ("net: qualcomm: rmnet: Allow to configure flags for existing devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index 38d9356ebcc4..d33988570217 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -312,6 +312,8 @@ static int rmnet_changelink(struct net_device *dev, struct nlattr *tb[],
 	if (data[IFLA_RMNET_MUX_ID]) {
 		mux_id = nla_get_u16(data[IFLA_RMNET_MUX_ID]);
 		ep = rmnet_get_endpoint(port, priv->mux_id);
+		if (!ep)
+			return -ENODEV;
 
 		hlist_del_init_rcu(&ep->hlnode);
 		hlist_add_head_rcu(&ep->hlnode, &port->muxed_ep[mux_id]);
-- 
2.15.1

