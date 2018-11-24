From: Colin King <colin.king@canonical.com>
Date: Sat, 24 Nov 2018 15:03:02 +0000
Subject: [PATCH] net: qualcomm: rmnet: move null check on dev before dereferecing it
Message-Id: <20181124150302.20339-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently dev is dereferenced by the call dev_net(dev) before dev is null
checked.  Fix this by null checking dev before the potential null
pointer dereference.

Detected by CoverityScan, CID#1462955 ("Dereference before null check")

Fixes: 23790ef12082 ("net: qualcomm: rmnet: Allow to configure flags for existing devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index 5f4e447c5dce..b8bbee645f51 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -301,10 +301,13 @@ static int rmnet_changelink(struct net_device *dev, struct nlattr *tb[],
 	struct rmnet_port *port;
 	u16 mux_id;
 
+	if (!dev)
+		return -ENODEV;
+
 	real_dev = __dev_get_by_index(dev_net(dev),
 				      nla_get_u32(tb[IFLA_LINK]));
 
-	if (!real_dev || !dev || !rmnet_is_real_dev_registered(real_dev))
+	if (!real_dev || !rmnet_is_real_dev_registered(real_dev))
 		return -ENODEV;
 
 	port = rmnet_get_port_rtnl(real_dev);
-- 
2.19.1
