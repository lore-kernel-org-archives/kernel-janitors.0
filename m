From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 15 Sep 2018 01:33:38 +0000
Subject: [PATCH net-next] net: dsa: gswip: Fix copy-paste error in gswip_gphy_fw_probe()
Message-Id: <1536975218-185034-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The return value from of_reset_control_array_get_exclusive() is not
checked correctly. The test is done against a wrong variable. This
patch fix it.

Fixes: 14fceff4771e ("net: dsa: Add Lantiq / Intel DSA driver for vrx200")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/dsa/lantiq_gswip.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/lantiq_gswip.c b/drivers/net/dsa/lantiq_gswip.c
index 9c28d0b..9c10570 100644
--- a/drivers/net/dsa/lantiq_gswip.c
+++ b/drivers/net/dsa/lantiq_gswip.c
@@ -934,10 +934,10 @@ static int gswip_gphy_fw_probe(struct gswip_priv *priv,
 	}
 
 	gphy_fw->reset = of_reset_control_array_get_exclusive(gphy_fw_np);
-	if (IS_ERR(priv->gphy_fw)) {
-		if (PTR_ERR(priv->gphy_fw) != -EPROBE_DEFER)
+	if (IS_ERR(gphy_fw->reset)) {
+		if (PTR_ERR(gphy_fw->reset) != -EPROBE_DEFER)
 			dev_err(dev, "Failed to lookup gphy reset\n");
-		return PTR_ERR(priv->gphy_fw);
+		return PTR_ERR(gphy_fw->reset);
 	}
 
 	return gswip_gphy_fw_load(priv, gphy_fw);
