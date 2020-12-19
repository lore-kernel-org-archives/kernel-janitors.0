From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 19 Dec 2020 13:28:00 +0000
Subject: [PATCH] dmaengine: milbeaut-xdmac: Fix a resource leak in the error handling path of the probe funct
Message-Id: <20201219132800.183254-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vkoul@kernel.org, dan.j.williams@intel.com, jaswinder.singh@linaro.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'disable_xdmac()' should be called in the error handling path of the
probe function to undo a previous 'enable_xdmac()' call, as already
done in the remove function.

Fixes: a6e9be055d47 ("dmaengine: milbeaut-xdmac: Add XDMAC driver for Milbeaut platforms")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Purely speculative
---
 drivers/dma/milbeaut-xdmac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/milbeaut-xdmac.c b/drivers/dma/milbeaut-xdmac.c
index 584c931e807a..d29d01e730aa 100644
--- a/drivers/dma/milbeaut-xdmac.c
+++ b/drivers/dma/milbeaut-xdmac.c
@@ -350,7 +350,7 @@ static int milbeaut_xdmac_probe(struct platform_device *pdev)
 
 	ret = dma_async_device_register(ddev);
 	if (ret)
-		return ret;
+		goto disable_xdmac;
 
 	ret = of_dma_controller_register(dev->of_node,
 					 of_dma_simple_xlate, mdev);
@@ -363,6 +363,8 @@ static int milbeaut_xdmac_probe(struct platform_device *pdev)
 
 unregister_dmac:
 	dma_async_device_unregister(ddev);
+disable_xdmac:
+	disable_xdmac(mdev);
 	return ret;
 }
 
-- 
2.27.0
