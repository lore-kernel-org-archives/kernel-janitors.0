From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2021 09:13:44 +0000
Subject: [PATCH v3 2/2 net-next] net: mscc: ocelot: fix error code in mscc_ocelot_probe()
Message-Id: <YBkXyFIl4V9hgxYM@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <YBkXhqRxHtRGzSnJ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, UNGLinuxDriver@microchip.com, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Probe should return an error code if platform_get_irq_byname() fails
but it returns success instead.

Fixes: 6c30384eb1de ("net: mscc: ocelot: register devlink ports")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v3: rebase

 drivers/net/ethernet/mscc/ocelot_vsc7514.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_vsc7514.c b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
index b52e24826b10..6b6eb92149ba 100644
--- a/drivers/net/ethernet/mscc/ocelot_vsc7514.c
+++ b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
@@ -1300,8 +1300,10 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 		goto out_free_devlink;
 
 	irq_xtr = platform_get_irq_byname(pdev, "xtr");
-	if (irq_xtr < 0)
+	if (irq_xtr < 0) {
+		err = irq_xtr;
 		goto out_free_devlink;
+	}
 
 	err = devm_request_threaded_irq(&pdev->dev, irq_xtr, NULL,
 					ocelot_xtr_irq_handler, IRQF_ONESHOT,
-- 
2.30.0
