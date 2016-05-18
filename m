From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 May 2016 10:39:05 +0000
Subject: [patch] crypto: omap-sham - potential Oops on error in probe
Message-Id: <20160518103905.GA10470@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

This if statement is reversed so we end up either leaking or Oopsing on
error.

Fixes: dbe246209bc1 ('crypto: omap-sham - Use dma_request_chan() for requesting DMA channel')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 6eefaa2..63464e8 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -1986,7 +1986,7 @@ err_algs:
 					&dd->pdata->algs_info[i].algs_list[j]);
 err_pm:
 	pm_runtime_disable(dev);
-	if (dd->polling_mode)
+	if (!dd->polling_mode)
 		dma_release_channel(dd->dma_lch);
 data_err:
 	dev_err(dev, "initialization failed.\n");
