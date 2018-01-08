From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 08 Jan 2018 06:47:36 +0000
Subject: [PATCH] iio: adc: aspeed: Fix error handling path
Message-Id: <20180108064736.15991-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, raltherr@google.com, joel@jms.id.au, arvind.yadav.cs@gmail.com, mykolak@mellanox.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The labels and branching order of the error path of 'aspeed_adc_probe()'
are broken.
Re-order the labels and goto statements.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure where it comes from.
Merge conflict incorrectly fixed?
---
 drivers/iio/adc/aspeed_adc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 327a49ba1991..9515ca165dfd 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -243,7 +243,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 					 ASPEED_ADC_INIT_POLLING_TIME,
 					 ASPEED_ADC_INIT_TIMEOUT);
 		if (ret)
-			goto scaler_error;
+			goto poll_timeout_error;
 	}
 
 	/* Start all channels in normal mode. */
@@ -274,9 +274,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	writel(ASPEED_OPERATION_MODE_POWER_DOWN,
 		data->base + ASPEED_REG_ENGINE_CONTROL);
 	clk_disable_unprepare(data->clk_scaler->clk);
-reset_error:
-	reset_control_assert(data->rst);
 clk_enable_error:
+poll_timeout_error:
+	reset_control_assert(data->rst);
+reset_error:
 	clk_hw_unregister_divider(data->clk_scaler);
 scaler_error:
 	clk_hw_unregister_divider(data->clk_prescaler);
-- 
2.14.1

