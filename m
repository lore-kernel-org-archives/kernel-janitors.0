From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 28 Feb 2020 21:38:38 +0000
Subject: [PATCH] spi: bcm63xx-hsspi: Really keep pll clk enabled
Message-Id: <20200228213838.7124-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@kernel.org, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, jonas.gorski@gmail.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org

The purpose of commit 0fd85869c2a9 ("spi/bcm63xx-hsspi: keep pll clk enabled")
was to keep the pll clk enabled through the lifetime of the device.

In order to do that, some 'clk_prepare_enable()'/'clk_disable_unprepare()'
calls have been added in the error handling path of the probe function, in
the remove function and in the suspend and resume functions.

However, a 'clk_disable_unprepare()' call has been unfortunately left in
the probe function. So the commit seems to be more or less a no-op.

Axe it now, so that the pll clk is left enabled through the lifetime of
the device, as described in the commit.

Fixes: 0fd85869c2a9 ("spi/bcm63xx-hsspi: keep pll clk enabled")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
To be honest, I don't see why we need to keep pll clk, or hsspi clk
enabled during the lifetime of the driver. My understanding of the code is
that it is only used to get the 'speed_hz' value in the probe function.
This value is never refreshed afterwards.
I don't see the point in enabling/disabling the clks. I think that they
both could be disabled in the probe function, without the need to keep
track in the bcm63xx_hsspi structure, neither during pm cycles or the
remove fucntion.

However, my knowledge on drivers is limited and I may be completly wrong :)
---
 drivers/spi/spi-bcm63xx-hsspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
index 7327309ea3d5..6c235306c0e4 100644
--- a/drivers/spi/spi-bcm63xx-hsspi.c
+++ b/drivers/spi/spi-bcm63xx-hsspi.c
@@ -366,7 +366,6 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
 			goto out_disable_clk;
 
 		rate = clk_get_rate(pll_clk);
-		clk_disable_unprepare(pll_clk);
 		if (!rate) {
 			ret = -EINVAL;
 			goto out_disable_pll_clk;
-- 
2.20.1
