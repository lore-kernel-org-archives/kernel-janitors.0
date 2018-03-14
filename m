From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 14 Mar 2018 19:56:38 +0000
Subject: [PATCH 2/3] remoteproc: imx_rproc: Re-use existing error handling path in 'imx_rproc_probe()'
Message-Id: <2b1b1c3ebd6798ac456affb0bb6580016f17afe8.1521057013.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Avoid some code ducplication and be more future-proof.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/remoteproc/imx_rproc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 05bcbce2013a..6d02ef62a626 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -361,8 +361,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
-		rproc_free(rproc);
-		return PTR_ERR(priv->clk);
+		ret = PTR_ERR(priv->clk);
+		goto err_put_rproc;
 	}
 
 	/*
@@ -372,8 +372,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(priv->clk);
 	if (ret) {
 		dev_err(&rproc->dev, "Failed to enable clock\n");
-		rproc_free(rproc);
-		return ret;
+		goto err_put_rproc;
 	}
 
 	ret = rproc_add(rproc);
-- 
2.14.1

