From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 27 Apr 2020 11:10:43 +0000
Subject: [PATCH] dmaengine: qcom_hidma: Simplify error handling path in hidma_probe
Message-Id: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: okaya@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org, dan.j.williams@intel.com
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to call 'hidma_debug_uninit()' in the error handling
path. 'hidma_debug_init()' has not been called yet.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/qcom/hidma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 411f91fde734..87490e125bc3 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -897,7 +897,6 @@ static int hidma_probe(struct platform_device *pdev)
 	if (msi)
 		hidma_free_msis(dmadev);
 
-	hidma_debug_uninit(dmadev);
 	hidma_ll_uninit(dmadev->lldev);
 dmafree:
 	if (dmadev)
-- 
2.25.1
