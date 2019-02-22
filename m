From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Feb 2019 06:32:26 +0000
Subject: [PATCH] media: staging/imx7: Fix an error code in mipi_csis_clk_get()
Message-Id: <20190222063226.GA12101@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return IS_ERR(), which is 1, instead of the PTR_ERR()
which is the negative error code.

Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index f4674de09e83..4ac0be9e4487 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -491,7 +491,7 @@ static int mipi_csis_clk_get(struct csi_state *state)
 
 	state->wrap_clk = devm_clk_get(dev, "wrap");
 	if (IS_ERR(state->wrap_clk))
-		return IS_ERR(state->wrap_clk);
+		return PTR_ERR(state->wrap_clk);
 
 	/* Set clock rate */
 	ret = clk_set_rate(state->wrap_clk, state->clk_frequency);
-- 
2.17.1
