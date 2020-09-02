From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Sep 2020 11:56:31 +0000
Subject: [PATCH net] net: gemini: Fix another missing clk_disable_unprepare() in probe
Message-Id: <20200902115631.GA286978@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Wang Hai <wanghai38@huawei.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently added some calls to clk_disable_unprepare() but we missed
the last error path if register_netdev() fails.

I made a couple cleanups so we avoid mistakes like this in the future.
First I reversed the "if (!ret)" condition and pulled the code in one
indent level.  Also, the "port->netdev = NULL;" is not required because
"port" isn't used again outside this function so I deleted that line.

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/cortina/gemini.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 62e271aea4a5..ffec0f3dd957 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2446,8 +2446,8 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(port->reset)) {
 		dev_err(dev, "no reset\n");
-		clk_disable_unprepare(port->pclk);
-		return PTR_ERR(port->reset);
+		ret = PTR_ERR(port->reset);
+		goto unprepare;
 	}
 	reset_control_reset(port->reset);
 	usleep_range(100, 500);
@@ -2502,25 +2502,25 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 					IRQF_SHARED,
 					port_names[port->id],
 					port);
-	if (ret) {
-		clk_disable_unprepare(port->pclk);
-		return ret;
-	}
+	if (ret)
+		goto unprepare;
 
 	ret = register_netdev(netdev);
-	if (!ret) {
+	if (ret)
+		goto unprepare;
+
+	netdev_info(netdev,
+		    "irq %d, DMA @ 0x%pap, GMAC @ 0x%pap\n",
+		    port->irq, &dmares->start,
+		    &gmacres->start);
+	ret = gmac_setup_phy(netdev);
+	if (ret)
 		netdev_info(netdev,
-			    "irq %d, DMA @ 0x%pap, GMAC @ 0x%pap\n",
-			    port->irq, &dmares->start,
-			    &gmacres->start);
-		ret = gmac_setup_phy(netdev);
-		if (ret)
-			netdev_info(netdev,
-				    "PHY init failed, deferring to ifup time\n");
-		return 0;
-	}
+			    "PHY init failed, deferring to ifup time\n");
+	return 0;
 
-	port->netdev = NULL;
+unprepare:
+	clk_disable_unprepare(port->pclk);
 	return ret;
 }
 
-- 
2.28.0
