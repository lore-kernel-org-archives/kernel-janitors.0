From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Dec 2020 11:48:38 +0000
Subject: [PATCH] net: mscc: ocelot: Fix a resource leak in the error handling path of the probe function
Message-Id: <20201213114838.126922-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: UNGLinuxDriver@microchip.com, vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com, davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error after calling 'ocelot_init()', it must be undone by a
corresponding 'ocelot_deinit()' call, as already done in the remove
function.

Fixes: a556c76adc05 ("net: mscc: Add initial Ocelot switch support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/mscc/ocelot_vsc7514.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_vsc7514.c b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
index 1e7729421a82..9cf2bc5f4289 100644
--- a/drivers/net/ethernet/mscc/ocelot_vsc7514.c
+++ b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
@@ -1267,7 +1267,7 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 
 	err = mscc_ocelot_init_ports(pdev, ports);
 	if (err)
-		goto out_put_ports;
+		goto out_ocelot_deinit;
 
 	if (ocelot->ptp) {
 		err = ocelot_init_timestamp(ocelot, &ocelot_ptp_clock_info);
@@ -1282,8 +1282,14 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 	register_switchdev_notifier(&ocelot_switchdev_nb);
 	register_switchdev_blocking_notifier(&ocelot_switchdev_blocking_nb);
 
+	of_node_put(ports);
+
 	dev_info(&pdev->dev, "Ocelot switch probed\n");
 
+	return 0;
+
+out_ocelot_deinit:
+	ocelot_deinit(ocelot);
 out_put_ports:
 	of_node_put(ports);
 	return err;
-- 
2.27.0
