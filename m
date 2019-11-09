From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 09 Nov 2019 09:06:03 +0000
Subject: [PATCH 3/3] fsl/fman: Return directly after a failed devm_kzalloc() in mac_probe()
Message-Id: <8ffc16a2-62cc-f948-e11b-55bae1d6aae4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <132e8369-c4da-249f-76b8-834e394dc6d5@web.de>
In-Reply-To: <132e8369-c4da-249f-76b8-834e394dc6d5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Madalin Bucur <madalin.bucur@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 9 Nov 2019 09:26:12 +0100

Return directly after a call of the function “devm_kzalloc” failed
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/freescale/fman/mac.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 7fbd7cc24ede..75614e2ebda3 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -614,15 +614,12 @@ static int mac_probe(struct platform_device *_of_dev)
 	mac_node = dev->of_node;

 	mac_dev = devm_kzalloc(dev, sizeof(*mac_dev), GFP_KERNEL);
-	if (!mac_dev) {
-		err = -ENOMEM;
-		goto _return;
-	}
+	if (!mac_dev)
+		return -ENOMEM;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		err = -ENOMEM;
-		goto _return;
-	}
+	if (!priv)
+		return -ENOMEM;

 	/* Save private information */
 	mac_dev->priv = priv;
--
2.24.0
