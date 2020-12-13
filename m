From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Dec 2020 15:35:13 +0000
Subject: [PATCH] staging: mt7621-dma: Fix a resource leak in an error handling path
Message-Id: <20201213153513.138723-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, matthias.bgg@gmail.com, gokcekuler@gmail.com, romain.perier@gmail.com, siddhantgupta416@gmail.com, apais@linux.microsoft.com, blogic@openwrt.org, neil@brown.name
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org

If an error occurs after calling 'mtk_hsdma_init()', it must be undone by
a corresponding call to 'mtk_hsdma_uninit()' as already done in the
remove function.

Fixes: 0853c7a53eb3 ("staging: mt7621-dma: ralink: add rt2880 dma engine")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/mt7621-dma/mtk-hsdma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index d241349214e7..bc4bb4374313 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -712,7 +712,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(dd);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register dma device\n");
-		return ret;
+		goto err_uninit_hsdma;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node,
@@ -728,6 +728,8 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 
 err_unregister:
 	dma_async_device_unregister(dd);
+err_uninit_hsdma:
+	mtk_hsdma_uninit(hsdma);
 	return ret;
 }
 
-- 
2.27.0
