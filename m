From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Sep 2020 12:49:42 +0000
Subject: [PATCH] Input: imx6ul_tsc - clean up some errors in imx6ul_tsc_resume()
Message-Id: <20200905124942.GC183976@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

If imx6ul_tsc_init() fails then we need to clean up the clocks.

I reversed the "if (input_dev->users) {" condition to make the code a
bit simpler.

Fixes: 6cc527b05847 ("Input: imx6ul_tsc - propagate the errors")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/touchscreen/imx6ul_tsc.c | 27 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 9ed258854349..5e6ba5c4eca2 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -530,20 +530,25 @@ static int __maybe_unused imx6ul_tsc_resume(struct device *dev)
 
 	mutex_lock(&input_dev->mutex);
 
-	if (input_dev->users) {
-		retval = clk_prepare_enable(tsc->adc_clk);
-		if (retval)
-			goto out;
-
-		retval = clk_prepare_enable(tsc->tsc_clk);
-		if (retval) {
-			clk_disable_unprepare(tsc->adc_clk);
-			goto out;
-		}
+	if (!input_dev->users)
+		goto out;
 
-		retval = imx6ul_tsc_init(tsc);
+	retval = clk_prepare_enable(tsc->adc_clk);
+	if (retval)
+		goto out;
+
+	retval = clk_prepare_enable(tsc->tsc_clk);
+	if (retval) {
+		clk_disable_unprepare(tsc->adc_clk);
+		goto out;
 	}
 
+	retval = imx6ul_tsc_init(tsc);
+	if (retval) {
+		clk_disable_unprepare(tsc->tsc_clk);
+		clk_disable_unprepare(tsc->adc_clk);
+		goto out;
+	}
 out:
 	mutex_unlock(&input_dev->mutex);
 	return retval;
-- 
2.28.0
