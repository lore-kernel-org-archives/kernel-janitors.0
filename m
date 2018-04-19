From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:06:01 +0000
Subject: [PATCH 31/61] net: dsa: simplify getting .drvdata
Message-Id: <20180419140641.27926-32-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/net/dsa/bcm_sf2.c | 6 ++----
 drivers/net/dsa/qca8k.c   | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 0378eded31f2..a61b937d1a37 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1148,16 +1148,14 @@ static void bcm_sf2_sw_shutdown(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int bcm_sf2_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct bcm_sf2_priv *priv = platform_get_drvdata(pdev);
+	struct bcm_sf2_priv *priv = dev_get_drvdata(dev);
 
 	return dsa_switch_suspend(priv->dev->ds);
 }
 
 static int bcm_sf2_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct bcm_sf2_priv *priv = platform_get_drvdata(pdev);
+	struct bcm_sf2_priv *priv = dev_get_drvdata(dev);
 
 	return dsa_switch_resume(priv->dev->ds);
 }
diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index 600d5ad1fbde..9f503e5db88a 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -910,8 +910,7 @@ qca8k_set_pm(struct qca8k_priv *priv, int enable)
 
 static int qca8k_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct qca8k_priv *priv = platform_get_drvdata(pdev);
+	struct qca8k_priv *priv = dev_get_drvdata(dev);
 
 	qca8k_set_pm(priv, 0);
 
@@ -920,8 +919,7 @@ static int qca8k_suspend(struct device *dev)
 
 static int qca8k_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct qca8k_priv *priv = platform_get_drvdata(pdev);
+	struct qca8k_priv *priv = dev_get_drvdata(dev);
 
 	qca8k_set_pm(priv, 1);
 
-- 
2.11.0

