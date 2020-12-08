From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 08 Dec 2020 20:35:27 +0000
Subject: [PATCH] mmc: mxs-mmc: Fix a resource leak in an error handling path in 'mxs_mmc_probe()'
Message-Id: <20201208203527.49262-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ulf.hansson@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, wsa+renesas@sang-engineering.com, peter.ujfalusi@ti.com, dianders@chromium.org, cjb@laptop.org
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

If 'mmc_of_parse()' fails, we must undo the previous 'dma_request_chan()'
call.

Fixes: abd37cccd47f ("mmc: mxs: use mmc_gpio_get_ro for detecting read-only status")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I'm not 100% sure of the Fixes tag, but it seems to be the root cause. The
erroneous 'out_clk_disable' has then been kept around in the following
commits
---
 drivers/mmc/host/mxs-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
index 56bbc6cd9c84..947581de7860 100644
--- a/drivers/mmc/host/mxs-mmc.c
+++ b/drivers/mmc/host/mxs-mmc.c
@@ -628,7 +628,7 @@ static int mxs_mmc_probe(struct platform_device *pdev)
 
 	ret = mmc_of_parse(mmc);
 	if (ret)
-		goto out_clk_disable;
+		goto out_free_dma;
 
 	mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
 
-- 
2.27.0
