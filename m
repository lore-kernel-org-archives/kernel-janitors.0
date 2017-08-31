From: Colin King <colin.king@canonical.com>
Date: Thu, 31 Aug 2017 14:07:27 +0000
Subject: [PATCH][net-next] net: qualcomm: rmnet: remove unused variable priv
Message-Id: <20170831140727.28170-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

priv is being assigned but is never used, so remove it.

Cleans up clang build warning:
"warning: Value stored to 'priv' is never read"

Fixes: ceed73a2cf4a ("drivers: net: ethernet: qualcomm: rmnet: Initial implementation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index c8b573d28dcf..bf7455fdafcc 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
@@ -73,9 +73,6 @@ static const struct net_device_ops rmnet_vnd_ops = {
  */
 void rmnet_vnd_setup(struct net_device *rmnet_dev)
 {
-	struct rmnet_priv *priv;
-
-	priv = netdev_priv(rmnet_dev);
 	netdev_dbg(rmnet_dev, "Setting up device %s\n", rmnet_dev->name);
 
 	rmnet_dev->netdev_ops = &rmnet_vnd_ops;
-- 
2.14.1

