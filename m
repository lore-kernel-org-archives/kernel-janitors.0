From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 14 Mar 2018 19:56:37 +0000
Subject: [PATCH 1/3] remoteproc: imx_rproc: Fix an error handling path in 'imx_rproc_probe()'
Message-Id: <f944d560ce1b1573be00697d66c4a49b14680af9.1521057013.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'of_device_get_match_data()' fails, we must undo the previous
'rproc_alloc()' call.

Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/remoteproc/imx_rproc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 633268e9d550..05bcbce2013a 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -339,8 +339,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	}
 
 	dcfg = of_device_get_match_data(dev);
-	if (!dcfg)
-		return -EINVAL;
+	if (!dcfg) {
+		ret = -EINVAL;
+		goto err_put_rproc;
+	}
 
 	priv = rproc->priv;
 	priv->rproc = rproc;
-- 
2.14.1

