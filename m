From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:06:06 +0000
Subject: [PATCH 36/61] net: ethernet: wiznet: simplify getting .drvdata
Message-Id: <20180419140641.27926-37-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, netdev@vger.kernel.org

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/net/ethernet/wiznet/w5300.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/wiznet/w5300.c b/drivers/net/ethernet/wiznet/w5300.c
index 56ae573001e8..692fc71d904d 100644
--- a/drivers/net/ethernet/wiznet/w5300.c
+++ b/drivers/net/ethernet/wiznet/w5300.c
@@ -661,8 +661,7 @@ static int w5300_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int w5300_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct net_device *ndev = dev_get_drvdata(dev);
 	struct w5300_priv *priv = netdev_priv(ndev);
 
 	if (netif_running(ndev)) {
@@ -676,8 +675,7 @@ static int w5300_suspend(struct device *dev)
 
 static int w5300_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct net_device *ndev = dev_get_drvdata(dev);
 	struct w5300_priv *priv = netdev_priv(ndev);
 
 	if (!netif_running(ndev)) {
-- 
2.11.0

