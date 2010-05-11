From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 11 May 2010 06:57:44 +0000
Subject: [PATCH] crypto: mv_cesa - Use resource_size
Message-Id: <1273561064-3530-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org
Cc: davem@davemloft.net, kernel-janitors@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

Use the resource_size function instead of manually calculating the
resource size. This reduces the chance of introducing off-by-one errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/crypto/mv_cesa.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/mv_cesa.c b/drivers/crypto/mv_cesa.c
index 18a436c..e095422 100644
--- a/drivers/crypto/mv_cesa.c
+++ b/drivers/crypto/mv_cesa.c
@@ -1023,7 +1023,7 @@ static int mv_probe(struct platform_device *pdev)
 
 	spin_lock_init(&cp->lock);
 	crypto_init_queue(&cp->queue, 50);
-	cp->reg = ioremap(res->start, res->end - res->start + 1);
+	cp->reg = ioremap(res->start, resource_size(res));
 	if (!cp->reg) {
 		ret = -ENOMEM;
 		goto err;
@@ -1034,7 +1034,7 @@ static int mv_probe(struct platform_device *pdev)
 		ret = -ENXIO;
 		goto err_unmap_reg;
 	}
-	cp->sram_size = res->end - res->start + 1;
+	cp->sram_size = resource_size(res);
 	cp->max_req_size = cp->sram_size - SRAM_CFG_SPACE;
 	cp->sram = ioremap(res->start, cp->sram_size);
 	if (!cp->sram) {
-- 
1.6.3.3

