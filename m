From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Apr 2020 22:40:10 +0000
Subject: [PATCH] thermal: ti-soc-thermal: remove redundant assignment to variable i
Message-Id: <20200415224010.1564330-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable i is being assigned with a value that is never read,
the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thermal/ti-soc-thermal/ti-bandgap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
index ab19ceff6e2a..abaf629038c3 100644
--- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
+++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
@@ -1003,7 +1003,6 @@ int ti_bandgap_probe(struct platform_device *pdev)
 		ret = ti_bandgap_talert_init(bgp, pdev);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to initialize Talert IRQ\n");
-			i = bgp->conf->sensor_count;
 			goto disable_clk;
 		}
 	}
-- 
2.25.1
